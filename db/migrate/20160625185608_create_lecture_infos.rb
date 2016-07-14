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
      t.integer :av_fun, default: 0
      t.integer :av_teaching, default: 0
      t.integer :av_get_grade, default: 0
      t.integer :av_teamwork_n_asg, default: 0

      t.timestamps null: false
    end
  end
end
