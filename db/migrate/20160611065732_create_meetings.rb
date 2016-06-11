class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :name
      t.datetime :start_time
      t.text :content

      t.timestamps null: false
    end
  end
end
