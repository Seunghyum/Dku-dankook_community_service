class LectureEstimatesController < ApplicationController

  before_action :set_lecture_estimate, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_professor, only: [:index, :show]
  before_action :set_lecture_info, only: [:show, :index, :new, :create, :edit, :upvote, :downvote]

  # GET /lecture_estimates
  # GET /lecture_estimates.json
  def index
    @lecture_estimates = @lecture_info.lecture_estimates
    @color_pick = ["yellow", "purple", "sea", "red", "blue", "orange", "green"]

    @lecture_info.all_view += 1

    # 총 강의 평가
    gon.lecture_title = @lecture_info.name
    gon.av_fun = @lecture_info.av_fun
    gon.av_teaching = @lecture_info.av_teaching
    gon.av_get_grade = @lecture_info.av_get_grade
    gon.av_teamwork_n_asg = @lecture_info.av_teamwork_n_asg
  end

  # GET /lecture_estimates/new
  def new
    @lecture_estimate = LectureEstimate.new
  end

  # GET /lecture_estimates/1/edit
  def edit
  end

  # POST /lecture_estimates
  # POST /lecture_estimates.json
  def create
    @lecture_estimate = LectureEstimate.new(lecture_estimate_params)
    @lecture_estimate.lecture_info_id = @lecture_info.id

    @lecture_estimate.save
    redirect_to lecture_info_lecture_estimates_path(@lecture_info)
  end

  # PATCH/PUT /lecture_estimates/1
  # PATCH/PUT /lecture_estimates/1.json
  def update
    @lecture_estimate.update(lecture_estimate_params)
    redirect_to lecture_info_lecture_estimates_path(@lecture_info)
  end

  # DELETE /lecture_estimates/1
  # DELETE /lecture_estimates/1.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture_estimate
      @lecture_estimate = LectureEstimate.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_lecture_info
      @lecture_info = LectureInfo.find(params[:lecture_info_id])
    end

    def set_professor
      @professor = LectureInfo.find(params[:lecture_info_id]).professor
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_estimate_params
      params.require(:lecture_estimate).permit(:reason, :average, :fun, :teaching, :get_grade, :male_view, :female_view, :all_view, :tip, :msg, :teamwork_n_asg, :lecture_info_id)
    end
end
