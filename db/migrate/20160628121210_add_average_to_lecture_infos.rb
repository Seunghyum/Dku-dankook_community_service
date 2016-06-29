class AddAverageToLectureInfos < ActiveRecord::Migration
  def change
    add_column :lecture_infos, :average, :integer
  end
end
