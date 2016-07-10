class AddColsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lcounting, :integer
    add_reference :users, :locker, index: true, foreign_key: true
  end
end
