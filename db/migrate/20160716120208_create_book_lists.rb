class CreateBookLists < ActiveRecord::Migration
  def change
    create_table :book_lists do |t|
      t.string :name
      t.string :num_of_book

      t.timestamps null: false
    end
  end
end
