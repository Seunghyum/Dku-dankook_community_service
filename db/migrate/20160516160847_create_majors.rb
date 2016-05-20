class CreateMajors < ActiveRecord::Migration
  def change
    create_table :majors do |t|
      t.string :mname
      t.integer :locker_limit
      
      t.timestamps null: false
    end
  end
end
