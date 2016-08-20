class AddLockerTimeToMajors < ActiveRecord::Migration
  def change
    add_column :majors, :locker_start_time, :datetime
    add_column :majors, :locker_end_time, :datetime
  end
end
