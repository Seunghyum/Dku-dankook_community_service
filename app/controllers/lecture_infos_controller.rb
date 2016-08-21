class LectureInfosController < ApplicationController
  before_action :set_lecture_info, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].nil?
      @lecture_infos = LectureInfo.all
    elsif params[:category] == "강의명"
      @lecture_infos = LectureInfo.search(params[:search])
    elsif params[:category] == "교수명"
      @lecture_infos = LectureInfo.professor_search(params[:search])
    end

    if params[:group_search].present?
      @lecture_infos = LectureInfo.group_search(params[:group_search])
    end

    if params[:filter] == "전체"
    elsif params[:filter].present?
      @lecture_infos = @lecture_infos.where(l_type: params[:filter])
    end

    unless @lecture_infos.nil?
      @lecture_info_pages = @lecture_infos.page(params[:page]).per(7)
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
