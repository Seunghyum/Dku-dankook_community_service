class CreateLectureInfos < ActiveRecord::Migration
  def change
    create_table :lecture_infos do |t|
      t.string :name
      t.string :l_type
      t.integer :time
      t.integer :semester
      t.integer :male_view, default: 0
      t.integer :female_view, default: 0
      t.integer :all_view, default: 0
      t.integer :av_fun
      t.integer :av_teaching
      t.integer :av_get_grade
      t.integer :av_teamwork_n_asg

      t.timestamps null: false
    end
  end
end
