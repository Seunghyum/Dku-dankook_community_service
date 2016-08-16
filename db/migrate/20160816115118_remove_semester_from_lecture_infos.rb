class RemoveSemesterFromLectureInfos < ActiveRecord::Migration
  def change
    remove_column :lecture_infos, :semester, :string
  end
end
