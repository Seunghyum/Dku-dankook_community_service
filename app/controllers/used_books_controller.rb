class UsedBooksController < InheritedResources::Base
  layout "dku"

  before_action :set_used_book, only: [ :destroy, :selecting ]
  before_action :authenticate_user!, :except => "manage"
  before_action :check_start_time_nil, :check_start_time, :check_end_time, except: [:nottime, :home, :reject, :result]

  #자신의 로커 상태 표시 page + 첫번째 번호표 뽑기 view page
  def index
    @able_used_books = UsedBook.search(params[:btitle]).where(major_id: current_user.major_id, user_id: nil).page(params[:page]).per(10)
    @my_used_books = UsedBook.where(major_id: current_user.major_id, user_id: current_user.id)
  end

  #책 선택 로직
  def selecting
    #책의 대여자가 없을 때
    if @selecting_used_book.user_id.nil?

      #만일 같은이름의 책을 가지고 있다면 가지지 못하게.
        if @my_used_book.nil?
          @selecting_used_book.update( user_id: current_user.id )
          flash[:success] = "<#{@selecting_used_book.btitle}>을 신청했습니다."
        else
          flash[:warning] = "같은 책을 2권이상 신청 할 수 없습니다."
        end

        redirect_to used_books_path
    else
      flash[:danger] = "다른 사람이 이미 가져갔습니다."
      redirect_to used_books_path
    end
  end

  def destroy
    @selecting_used_book.update(user_id: nil)
    flash[:warning] = '책 신청권을 포기했습니다.'
    redirect_to used_books_path
  end

  def result
    @used_books = UsedBook.where(major_id: current_user.major_id)
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="중고책-' + current_user.major.name + '.xlsx"'
      }
    end
  end

private
  def set_used_book
    if params[:id].present?
      #선택한 책
      @selecting_used_book = UsedBook.find(params[:id])

      #이미 가지고 있는 책이 선택한 책과 겹치는지
      @my_used_book = UsedBook.where(user_id: current_user.id, btitle: @selecting_used_book.btitle).take
    end
  end

  def check_start_time
    @start_time = current_user.major.book_start_time
    if @start_time > Time.now.in_time_zone("Seoul")
      redirect_to action: "nottime"
    end
  end
  def check_end_time
    @end_time = current_user.major.book_end_time
    if @end_time < Time.now.in_time_zone("Seoul")
      redirect_to action: "nottime"
    end
  end
  def check_start_time_nil
    if current_user.major.locker_start_time == nil
      redirect_to action: "nottime"
    end
  end
end
