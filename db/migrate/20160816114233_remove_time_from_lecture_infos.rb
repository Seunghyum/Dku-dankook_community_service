class RemoveTimeFromLectureInfos < ActiveRecord::Migration
  def change
    remove_column :lecture_infos, :time, :integer
  end
end
