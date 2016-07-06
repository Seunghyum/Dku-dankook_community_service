class RehearsalsController < ApplicationController
  layout "rehearsal"
  before_action :set_test_lecture, only: [:show, :edit, :update, :destroy]

  def home
  end

  def sign_in
  end

  def sign_up
  end
  # GET /test_lectures
  # GET /test_lectures.json
  def index
    @test_lectures = TestLecture.all
  end

  # GET /test_lectures/1
  # GET /test_lectures/1.json
  def show
  end

  # GET /test_lectures/new
  def new
    @test_lecture = TestLecture.new
  end

  # GET /test_lectures/1/edit
  def edit
  end

  # POST /test_lectures
  # POST /test_lectures.json
  def create
    @test_lecture = TestLecture.new(test_lecture_params)

    respond_to do |format|
      if @test_lecture.save
        format.html { redirect_to @test_lecture, notice: 'TestLecture was successfully created.' }
        format.json { render :show, status: :created, location: @test_lecture }
      else
        format.html { render :new }
        format.json { render json: @test_lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_lectures/1
  # PATCH/PUT /test_lectures/1.json
  def update
    respond_to do |format|
      if @test_lecture.update(test_lecture_params)
        format.html { redirect_to @test_lecture, notice: 'test_lecture was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_lecture }
      else
        format.html { render :edit }
        format.json { render json: @test_lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_lectures/1
  # DELETE /test_lectures/1.json
  def destroy
    @test_lecture.destroy
    respond_to do |format|
      format.html { redirect_to rehearsals_url, notice: 'test_lecture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_lecture
      @test_lecture = TestLecture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_lecture_params
      params.require(:test_lecture).permit(:lnum, :name, :divide, :score, :teacher, :ldate, :limit_num, :counting)
    end
end
