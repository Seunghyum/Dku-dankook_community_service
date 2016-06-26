class LectureEstimatesController < ApplicationController
  before_action :set_lecture_estimate, only: [:show, :edit, :update, :destroy]
  before_action :set_lecture_professor, only: [:show]
  before_action :set_lecture_info, only: [:show]
  # GET /lecture_estimates
  # GET /lecture_estimates.json
  def index
    @lecture_estimates = LectureEstimate.all
    @color_pick = ["yellow", "purple", "sea", "red", "blue", "orange", "green"]
  end

  # GET /lecture_estimates/1
  # GET /lecture_estimates/1.json
  def show
    gon.fun = @lecture_estimate.fun
    gon.teaching = @lecture_estimate.teaching
    gon.get_grade = @lecture_estimate.get_grade
    gon.teamwork_n_asg = @lecture_estimate.teamwork_n_asg
    gon.lecture_title = @lecture_estimate.lecture_info.name
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

    respond_to do |format|
      if @lecture_estimate.save
        format.html { redirect_to @lecture_estimate, notice: 'Lecture estimate was successfully created.' }
        format.json { render :show, status: :created, location: @lecture_estimate }
      else
        format.html { render :new }
        format.json { render json: @lecture_estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lecture_estimates/1
  # PATCH/PUT /lecture_estimates/1.json
  def update
    respond_to do |format|
      if @lecture_estimate.update(lecture_estimate_params)
        format.html { redirect_to @lecture_estimate, notice: 'Lecture estimate was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture_estimate }
      else
        format.html { render :edit }
        format.json { render json: @lecture_estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecture_estimates/1
  # DELETE /lecture_estimates/1.json
  def destroy
    @lecture_estimate.destroy
    respond_to do |format|
      format.html { redirect_to lecture_estimates_url, notice: 'Lecture estimate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture_estimate
      @lecture_estimate = LectureEstimate.find(params[:id])
    end

    def set_lecture_professor
      @lecture_professor = LectureEstimate.find(params[:id]).lecture_info.professor
    end

    def set_lecture_info
      @lecture_info = LectureEstimate.find(params[:id]).lecture_info
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_estimate_params
      params.require(:lecture_estimate).permit(:reason, :average, :fun, :teaching, :get_grade, :male_view, :female_view, :all_view, :tip, :msg)
    end
end
