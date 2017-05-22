class LectureEstimatesController < ApplicationController
  layout "dku"

  before_action :set_lecture_estimate, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_professor, only: [:index, :show]
  before_action :set_lecture_info, only: [:show, :index, :new, :create, :edit, :upvote, :downvote]

  def index
    @lecture_estimates = @lecture_info.lecture_estimates.order("cached_votes_total DESC")
    @color_pick = ["yellow", "purple", "sea", "red", "blue", "orange", "green"]

    @lecture_info.all_view += 1

    # 총 강의 평가
    gon.lecture_title = @lecture_info.name
    gon.av_fun = @lecture_info.av_fun
    gon.av_teaching = @lecture_info.av_teaching
    gon.av_get_grade = @lecture_info.av_get_grade
    gon.av_teamwork_n_asg = @lecture_info.av_teamwork_n_asg
  end

  def new
    @lecture_estimate = LectureEstimate.new
  end

  def edit
  end

  def create
    @lecture_estimate = LectureEstimate.new(lecture_estimate_params)
    @lecture_estimate.lecture_info_id = @lecture_info.id

    @lecture_estimate.save
    redirect_to lecture_info_lecture_estimates_path(@lecture_info)
  end

  def update
    @lecture_estimate.update(lecture_estimate_params)
    redirect_to lecture_info_lecture_estimates_path(@lecture_info)
  end

  def destroy
    @lecture_estimate.destroy
    redirect_to lecture_info_lecture_estimates_path(@lecture_info)
  end

  def upvote
    @lecture_estimate.upvote_by current_user
    respond_to do |format|
      format.html
      format.js
    end
  end

  def downvote
    @lecture_estimate.downvote_by current_user
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def set_lecture_estimate
      @lecture_estimate = LectureEstimate.find(params[:id])
    end

    def set_lecture_info
      @lecture_info = LectureInfo.find(params[:lecture_info_id])
    end

    def set_professor
      @professor = LectureInfo.find(params[:lecture_info_id]).professor
    end

    def lecture_estimate_params
      params.require(:lecture_estimate).permit(:reason, :average, :fun, :teaching, :get_grade, :male_view, :female_view, :all_view, :tip, :msg, :teamwork_n_asg, :lecture_info_id)
    end
end
