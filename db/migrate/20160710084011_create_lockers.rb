class CreateLockers < ActiveRecord::Migration
  def change
    create_table :lockers do |t|
      t.integer :limit_num
      t.integer :counting, default: 0
      t.references :major, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
