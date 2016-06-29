class CreateLectureEstimates < ActiveRecord::Migration
  def change
    create_table :lecture_estimates do |t|
      t.string :reason
      t.integer :average, default: 0
      t.integer :fun, default: 0
      t.integer :teaching, default: 0
      t.integer :get_grade, default: 0
      t.integer :teamwork_n_asg, default: 0
      t.integer :male_view
      t.integer :female_view
      t.integer :all_view

      t.timestamps null: false
    end
  end
end
