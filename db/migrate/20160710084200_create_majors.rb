class CreateMajors < ActiveRecord::Migration
  def change
    create_table :majors do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.references :locker, index: true, foreign_key: true
      t.datetime :locker_time
      t.datetime :book_time

      t.timestamps null: false
    end
  end
end
