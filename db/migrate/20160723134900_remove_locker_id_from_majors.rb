class RemoveLockerIdFromMajors < ActiveRecord::Migration
  def change
    remove_reference :majors, :locker, index: true, foreign_key: true
  end
end
