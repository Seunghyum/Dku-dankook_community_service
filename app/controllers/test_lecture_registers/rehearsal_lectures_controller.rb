class TestLectureRegisters::RehearsalLecturesController < TestLectureRegisters::ApplicationController
  include RehearsalsHelper
  before_action :set_rehearsal_user, only: [:index, :create, :destroy]
  before_action :set_rehearsal_lecture, only: [:create, :destroy]
  before_action :set_rehearsal, only: [:create, :destroy]

  #auth
  # load_and_authorize_resource param_method: :rehearsal_lecture_params

  def index
    @rehearsal_lectures = RehearsalLecture.all
    @sucess_lectures = @rehearsal_user.rehearsal_lectures
  end

  def create
    # 신청한 강의의 limit_num이 초과되었는지
    if @rehearsal_lecture.limit_num > @rehearsal_lecture.counting
      # 유저가 강의를 신청 헀는지 || 강의를 이미 신청했었는지
      if @rehearsal_user.rehearsal_lectures.nil? || @rehearsal_user.rehearsal_lectures.find_by(name: params[:name]).nil?
        @rehearsal = Rehearsal.create(
          counting: @rehearsal_lecture.counting + 1,
          rehearsal_user_id: @rehearsal_user.id,
          rehearsal_lecture_id: @rehearsal_lecture.id
        )
        @rehearsal.rehearsal_lecture.update(counting: @rehearsal_lecture.counting + 1)
      end
    end
  end

  def destroy
    @rehearsal_lecture.counting -= 1
    @rehearsal_lecture.save
    @rehearsal.destroy
  end

  private

    def set_rehearsal_user
      @rehearsal_user = RehearsalUser.find(params[:rehearsal_user_id])
    end

    def set_rehearsal_lecture
      # byebug
      @rehearsal_lecture =  RehearsalLecture.find(params[:data_value])
    end

    def set_rehearsal
      # @rehearsal =  Rehearsal.where(rehearsal_lecture_id: params[:data_value], rehearsal_user_id: params[:rehearsal_user_id])
      @rehearsal =  @rehearsal_user.rehearsals.find_by(rehearsal_user_id: params[:rehearsal_user_id])
    end

    def rehearsal_lecture_params
      params.require(:rehearsal_lecture).permit(:lnum, :divide, :name, :score, :teacher, :ldate, :limit_num, :data_value)
    end
end
