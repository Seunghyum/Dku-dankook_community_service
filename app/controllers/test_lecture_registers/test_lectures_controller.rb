class TestLectureRegisters::TestLecturesController < TestLectureRegisters::ApplicationController
  before_action :set_test_lecture, only: [:show, :edit, :update, :destroy]

  #auth
  load_and_authorize_resource

  def home
  end

  def sign_in
  end

  def sign_up
  end

  def index
    @test_lectures = TestLecture.all
    @test_lecture = TestLecture.new
  end

  def create
    @test_lecture = TestLecture.new(test_lecture_params)

    respond_to do |format|
      if @test_lecture.save
        format.html { redirect_to @test_lecture}
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @test_lecture.destroy
    respond_to do |format|
      format.html { redirect_to rehearsals_url }
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
