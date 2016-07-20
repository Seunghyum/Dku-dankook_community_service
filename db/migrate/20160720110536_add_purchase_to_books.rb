class AddPurchaseToBooks < ActiveRecord::Migration
  def change
    add_column :books, :purchase, :boolean, default: false
  end
end
