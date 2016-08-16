class AddTimeToLectureInfos < ActiveRecord::Migration
  def change
    add_column :lecture_infos, :time, :string
  end
end
