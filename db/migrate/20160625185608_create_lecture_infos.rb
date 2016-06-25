class CreateLectureInfos < ActiveRecord::Migration
  def change
    create_table :lecture_infos do |t|
      t.string :name
      t.string :l_type
      t.integer :time
      t.integer :semester

      t.timestamps null: false
    end
  end
end
