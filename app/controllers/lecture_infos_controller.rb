class LectureInfosController < ApplicationController
  before_action :set_lecture_info, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category] == "강의명" || params[:category].nil? 
      @lecture_infos = LectureInfo.search(params[:search])
    elsif params[:category] == "교수 이름"
      @lecture_infos = LectureInfo.professor_search(params[:professor])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture_info
      @lecture_info = LectureInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_info_params
      params.require(:lecture_info).permit()
    end
end
