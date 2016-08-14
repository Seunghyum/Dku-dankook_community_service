class AddBindexToBooks < ActiveRecord::Migration
  def change
    add_column :books, :bindex, :string
  end
end
