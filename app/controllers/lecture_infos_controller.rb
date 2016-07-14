class LectureInfosController < ApplicationController
  before_action :set_lecture_info, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category] == "강의명" || params[:category].nil? || params[:filter].nil?
      @lecture_infos = LectureInfo.search(params[:search])
    else
      @lecture_infos = LectureInfo.search(params[:search]).where(l_type: params[:filter])
    end

    if params[:category] == "교수 이름" && params[:filter].nil?
      @lecture_infos = LectureInfo.professor_search(params[:professor])
    else
      @lecture_infos = LectureInfo.professor_search(params[:professor]).where(l_type: params[:filter])
    end

    if params[:filter] == "전체"
      @lecture_infos = LectureInfo.all
    end
    @best_liberal = BestFive.find_by(category: "교양").lecture_infos
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
