class AddBelongToLectureInfos < ActiveRecord::Migration
  def change
    add_column :lecture_infos, :belong, :string
  end
end
