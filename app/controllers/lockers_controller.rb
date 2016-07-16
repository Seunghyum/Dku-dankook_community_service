class LockersController < ApplicationController
  #auth
  # load_and_authorize_resource

  before_action :set_locker, only: [:index, :lockerselect, :destroy, :first_check, :selecting_page, :check_lcounting_for_reject]
  before_action :set_time, only: [:lockerselect, :first_check, :nottime ]
  # before_action :authenticate_user!, :except => "nottime"
#1차 접수 전 제한인원안에 들지 못한 유저의 사물함 선택 방어
  before_action :check_lcounting_for_reject, only: [:selecting_page, :lockerselect]
#1차 접수 없이 url타고 들어온 유저 방어
  before_action :check_lcounting_nil, only: [:selecting_page, :lockerselect]
#1차 접수 후 제한인원에 들지 못한인원 redirect
  after_action :check_lcounting_for_reject, only: [:first_check]
#1차 접수 후 selecting_page로 이동
  after_action :check_lcounting_for_selecting, only: [:first_check]

#자신의 로커 상태 표시 page + 첫번째 번호표 뽑기 view page
  def index
  end

  def nottime
  end

  def reject
  end

#1차접수 번호표 뽑기 로직
  def first_check
    if current_user.lcounting.nil?
      @our_locker.counting += 1
      @our_locker.save
      current_user.update(lcounting: @our_locker.counting)
      redirect_to action: "selecting_page"
    end
  end

#두번째 로커 선택하는 view page
  def selecting_page
    if current_user.lcounting > @our_locker.limit_num
      redirect_to action: "reject"
    end
  end

#두번째 로커 선택 로직
  def lockerselect
      #현재 유저가 사물함 가진것이 없을때
      if current_user.lnum.nil?
        current_user.update(lnum: @lnum)

        flash[:success] = "#{@lnum}번 사물함을 획득했습니다."
        redirect_to action: "index"

      # 사물함 점유한 사람이 뒤로가기 눌렀을 때 / 클릭한 사물함이 이미 점유되었을 때
      elsif current_user.lnum == @lnum
        redirect_to action: "index"
      #사물함이 이미 점유한 것인지
      elsif @selecting_locker
        flash[:danger] = "#{@lnum}번을 다른사람이 먼저 점유했습니다. 다시골라주세요."
        redirect_to action: "selecting_page"
      end
  end

  def destroy
      current_user.update(lnum: nil)
      redirect_to action: "selecting_page"
  end

  def manage
    @user_major_locker = current_user.major.users.order("lnum DESC")
  end

  private
    def set_locker
      #유저의 현재 사물함
      @our_locker = current_user.major.locker

      #유저가 클릭한 사물함 params값
      @lnum = params[:lnum].to_i

      #유저가 클릭한 사물함
      @selecting_locker = current_user.major.users.find_by(lnum: @lnum)
    end

    def check_lcounting_nil
      if current_user.lcounting.nil?
        redirect_to action: "index"
      end
    end

    def check_lcounting_for_reject
      if current_user.lcounting.nil?
        flash[:danger] = "1차 접수 이후에 가능합니다."
        redirect_to action: "index"
      elsif current_user.lcounting > @our_locker.limit_num
        flash[:danger] = "1차 접수 - 총 제한 인원 #{@our_locker.limit_num}명 중 #{current_user.lcounting}번째 입니다. 다음학기에....."
        redirect_to action: "reject"
      end
    end

    def check_lcounting_for_selecting
      if current_user.lcounting > @our_locker.limit_num
        flash[:success] = "1차 접수 - 총 제한 인원 #{@our_locker.limit_num}명 중 #{current_user.lcounting}번째 입니다."
        redirect_to action: "selecting_page"
      end
    end

    def set_time
      @time = Time.now
    end
end
