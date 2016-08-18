class AddStartEndToLockers < ActiveRecord::Migration
  def change
    add_column :lockers, :start_time, :datetime
    add_column :lockers, :end_time, :datetime
  end
end
