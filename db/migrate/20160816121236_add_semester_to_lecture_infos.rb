class AddSemesterToLectureInfos < ActiveRecord::Migration
  def change
    add_column :lecture_infos, :semester, :integer
  end
end
