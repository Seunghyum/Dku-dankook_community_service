class CreateRehearsalLectures < ActiveRecord::Migration
  def change
    create_table :rehearsal_lectures do |t|
      t.string :lnum
      t.string :divide
      t.string :name
      t.integer :score
      t.string :teacher
      t.string :ldate
      t.integer :limit_num
      t.integer :counting, default: 0

      t.timestamps null: false
    end
  end
end
