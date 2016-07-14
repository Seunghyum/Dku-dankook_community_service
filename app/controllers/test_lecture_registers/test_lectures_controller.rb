class TestLectureRegisters::TestLecturesController < TestLectureRegisters::ApplicationController
  before_action :set_test_lecture, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @rehearsal_lectures = RehearsalLecture.all
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_test_lecture
  #     @test_lecture = TestLecture.find(params[:id])
  #   end
end
