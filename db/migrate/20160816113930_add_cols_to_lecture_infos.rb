class AddColsToLectureInfos < ActiveRecord::Migration
  def change
    add_column :lecture_infos, :point, :integer
    add_column :lecture_infos, :tname, :string
  end
end
