class CreateLockers < ActiveRecord::Migration
  def change
    create_table :lockers do |t|
      t.integer :lnum

      t.timestamps null: false
    end
  end
end
