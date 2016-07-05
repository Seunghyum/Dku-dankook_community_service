class CreateRehearsals < ActiveRecord::Migration
  def change
    create_table :rehearsals do |t|
      t.integer :lnum
      t.string :divide
      t.string :name
      t.integer :score
      t.string :teacher
      t.string :ldate
      t.string :regi_num
      t.string :limit_num
      t.integer :ranking, default: 0

      t.timestamps null: false
    end
  end
end
