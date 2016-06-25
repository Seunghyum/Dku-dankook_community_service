class CreateLectureEstimates < ActiveRecord::Migration
  def change
    create_table :lecture_estimates do |t|
      t.string :reason
      t.integer :average
      t.integer :fun
      t.integer :teaching
      t.integer :get_grade
      t.integer :generous
      t.integer :teamwork_n_asg
      t.integer :male_view
      t.integer :female_view
      t.integer :all_view

      t.timestamps null: false
    end
  end
end
