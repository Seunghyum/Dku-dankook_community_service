class AddAverageToLectureInfos < ActiveRecord::Migration
  def change
    add_column :lecture_infos, :average, :integer, default: 0
  end
end
