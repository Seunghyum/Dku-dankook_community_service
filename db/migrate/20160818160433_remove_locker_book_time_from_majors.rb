class RemoveLockerBookTimeFromMajors < ActiveRecord::Migration
  def change
    remove_column :majors, :locker_time, :datetime
    remove_column :majors, :book_time, :datetime
  end
end
