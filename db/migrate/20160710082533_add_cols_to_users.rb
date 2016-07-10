class AddColsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lcounting, :integer
  end
end
