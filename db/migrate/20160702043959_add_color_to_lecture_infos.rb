class AddColorToLectureInfos < ActiveRecord::Migration
  def change
    add_column :lecture_infos, :div_color, :string
  end
end
