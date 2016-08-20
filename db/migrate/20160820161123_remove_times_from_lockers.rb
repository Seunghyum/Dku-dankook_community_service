class RemoveTimesFromLockers < ActiveRecord::Migration
  def change
    remove_column :lockers, :start_time, :datetime
    remove_column :lockers, :end_time, :datetime
  end
end
