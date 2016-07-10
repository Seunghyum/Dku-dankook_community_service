class CreateBookables < ActiveRecord::Migration
  def change
    create_table :bookables do |t|
      t.references :book, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :counting
      t.string :giver

      t.timestamps null: false
    end
  end
end
