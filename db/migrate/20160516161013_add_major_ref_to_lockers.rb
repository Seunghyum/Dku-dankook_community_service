class AddMajorRefToLockers < ActiveRecord::Migration
  def change
    add_reference :lockers, :major, index: true, foreign_key: true
  end
end
