class CreateBestFives < ActiveRecord::Migration
  def change
    create_table :best_fives do |t|
      t.string :category

      t.timestamps null: false
    end
  end
end
