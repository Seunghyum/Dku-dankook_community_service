class AddRefToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :book_list, index: true, foreign_key: true
  end
end
