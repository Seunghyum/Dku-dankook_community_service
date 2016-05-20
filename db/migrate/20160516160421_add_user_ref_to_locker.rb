class AddUserRefToLocker < ActiveRecord::Migration
  def change
    add_reference :lockers, :user, index: true, foreign_key: true
  end
end
