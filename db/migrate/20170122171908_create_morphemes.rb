class CreateMorphemes < ActiveRecord::Migration
  def change
    create_table :morphemes do |t|
      t.text :input

      t.timestamps null: false
    end
  end
end
