class AddNumOfPurchaseToBookLists < ActiveRecord::Migration
  def change
    add_column :book_lists, :num_of_purchase, :integer, default: 0
  end
end
