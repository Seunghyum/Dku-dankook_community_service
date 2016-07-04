class AddBestRefToLectureInfos < ActiveRecord::Migration
  def change
    add_reference :lecture_infos, :best_five, index: true, foreign_key: true
  end
end
