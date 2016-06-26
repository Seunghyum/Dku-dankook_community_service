class AddRefToLectureInfos < ActiveRecord::Migration
  def change
    add_reference :lecture_infos, :professor, index: true, foreign_key: true
  end
end
