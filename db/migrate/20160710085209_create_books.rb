class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :limit_num
      t.integer :counting, default: 0
      t.string :name
      t.string :cname
      t.string :grade
      t.references :major, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
