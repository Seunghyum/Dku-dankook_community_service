class AddLectureInfoRefToLectureEstimates < ActiveRecord::Migration
  def change
    add_reference :lecture_estimates, :lecture_info, index: true, foreign_key: true
  end
end
