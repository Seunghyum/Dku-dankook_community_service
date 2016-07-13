class AddMajorRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :major, index: true, foreign_key: true
  end
end
