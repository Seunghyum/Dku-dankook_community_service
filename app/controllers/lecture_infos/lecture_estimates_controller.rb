class LectureInfos::LectureEstimatesController < LectureEstimatesController
	before_action :set_lecuture_estimatable

	private
  	def set_lecuture_estimatable
  		@lecuture_estimatable = LectureInfo.find(params[:lecture_info_id])
  	end
end
