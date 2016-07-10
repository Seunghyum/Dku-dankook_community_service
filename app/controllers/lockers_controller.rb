class LockersController < ApplicationController
  #auth
  # load_and_authorize_resource

  before_action :set_numbering, only: [:first_check]
  before_action :set_locker, only: [:lockerselect, :destroy]
  before_action :set_time, only: [:lockerselect, :first_check, :nottime ]
  # before_action :authenticate_user!, :except => "nottime"

#자신의 로커 상태 표시 page + 첫번째 번호표 뽑기 view page
  def index
  end

  def nottime
  end

#1차접수 번호표 뽑기 로직
  def first_check
    if @time.hour >= 12 && @time.min >= 0
      #gba사람일 경우
      if current_user.gba
        if current_user.locker.nil?
            Locker.create(user_id: current_user.id, major_id: current_user.major.id)
            # current_user.update(locker_id: Locker.where(user_id: current_user.id).take.id)
            current_user.update(locker_id: current_user.locker.id)
            flash[:success] = "1차 접수 - 총 제한 인원 #{current_user.major.locker_limit}명 중 #{current_user.my_num}번째 입니다. 사물함을 선택해주세요"
            redirect_to :action => "selecting"

          #사물함 미소유자 / 제한 인원 안에 들지 못했을 때
        elsif current_user.locker
          flash[:danger] = "1차 접수 - 총 제한 인원 #{current_user.major.locker_limit}명 중 #{current_user.my_num}번째 입니다. 다음학기에....."
          redirect_to :action => "reject"

        #뒤로가기 방지 로직 - 사물함 소유자 / 제한인원 안에 들었을 때
        elsif current_user.locker
          flash[:success] = "1차 접수 - 총 제한 인원 #{current_user.major.locker_limit}명 중 #{current_user.my_num}번째 입니다. 사물함을 선택해주세요"
          redirect_to :action => "selecting"
        end


      #gba사람이 아닐 경우
      else

      #1차 접수 - 제한을 넘는지 확인하는 과정
        #처음으로 1차 접수 시

        if current_user.my_num == 0

            #1차 접수 - 제한을 넘는지 확인하는 과정
            current_user.update(my_num: @numbering)
            current_user.major.update(locker_numbering: @numbering)

          #사물함 미소유자 / 제한인원 안에 들었을 때
          if current_user.locker.nil? && current_user.my_num <= current_user.major.locker_limit
              Locker.create(user_id: current_user.id, major_id: current_user.major_id)
              current_user.update(locker_id: Locker.where(user_id: current_user.id).take.id)
              flash[:success] = "1차 접수 - 총 제한 인원 #{current_user.major.locker_limit}명 중 #{current_user.my_num}번째 입니다. 사물함을 선택해주세요"
              redirect_to :action => "selecting"
          #사물함 미소유자 / 제한 인원 안에 들지 못했을 때
          elsif current_user.locker && current_user.my_num > current_user.major.locker_limit
            flash[:danger] = "1차 접수 - 총 제한 인원 #{current_user.major.locker_limit}명 중 #{current_user.my_num}번째 입니다. 다음학기에....."
            redirect_to :action => "reject"

          #뒤로가기 방지 로직 - 사물함 소유자 / 제한인원 안에 들었을 때
          elsif current_user.locker && current_user.my_num <= current_user.major.locker_limit
            flash[:success] = "1차 접수 - 총 제한 인원 #{current_user.major.locker_limit}명 중 #{current_user.my_num}번째 입니다. 사물함을 선택해주세요"
            redirect_to :action => "selecting"
          end

        #제한 인원 안의 유저의 뒤로가기 방지
        elsif current_user.my_num >= 1
          flash[:success] = "이미 1차 접수 를 하셨습니다 - 총 제한 인원 #{current_user.major.locker_limit}명 중 #{current_user.my_num}번째 입니다. 사물함을 선택해주세요"
          redirect_to :action => "selecting"

        #제한 인원 넘는 유저 방지
        else
          redirect_to :action => "reject"
        end
      end
    else
      redirect_to :action => "nottime"
    end
  end

#두번째 로커 선택하는 view page
  def selecting_page
  end

#두번째 로커 선택 로직
  def lockerselect
    if current_user.my_num <= current_user.major.locker_limit
      #현재 유저가 사물함 가진것이 없을때
      if current_user.locker.lnum.nil? && @selecting_locker.nil?
        @mylocker.update(lnum: @lnum)

        flash[:success] = "#{@lnum}번 사물함을 획득했습니다."
        redirect_to locker_index_path

      # 사물함 얻을 수 있는 번호 일 때 / 클릭한 사물함이 점유되지 않았을 때
      elsif  @selecting_locker.nil?
        flash[:danger] = "이미 사물함을 가지고 있습니다. 반납 후 다시 골라주세요!"
        redirect_to locker_index_path

      # 사물함 점유한 사람이 뒤로가기 눌렀을 때 / 클릭한 사물함이 이미 점유되었을 때
      elsif @selecting_locker

        flash[:danger] = "#{@selecting_locker.lnum}번을 다른사람이 먼저 점유했습니다. 다시골라주세요."
        redirect_to locker_selecting_path
      end
    else
        #1차 접수 시 제한 인원 안에 들지 못했을 경우
        redirect_to locker_reject_path
    end
  end

  def destroy
      @mylocker.update(lnum: nil)
      redirect_to locker_selecting_path
  end

  def manage
    @user_major_locker = Locker.where(major_id: current_user.major_id) rescue nil
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_numbering
      @numbering = current_user.major.locker.count + 1
    end

    def set_locker
      #유저의 현재 사물함
      @mylocker = current_user.locker

      #유저가 클릭한 사물함
      @lnum = params[:lnum].to_i

      #유저가 클릭한 사물함 자체
      @selecting_locker = Locker.where(major_id: current_user.major_id, lnum: @lnum).take rescue nil
    end

    def set_time
      @time = Time.now + 9.hours
    end
end
