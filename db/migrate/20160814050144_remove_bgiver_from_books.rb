class RemoveBgiverFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :bgiver, :string
  end
end
