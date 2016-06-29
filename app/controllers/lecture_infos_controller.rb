class LectureInfosController < ApplicationController
  before_action :set_lecture_info, only: [:show, :edit, :update, :destroy]

  # GET /lecture_infos
  # GET /lecture_infos.json
  def index
    @lecture_infos = LectureInfo.all
    @color_pick = ["yellow", "purple", "sea", "red", "blue", "orange", "green"] 
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
