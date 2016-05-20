class AddUserRefToMajor < ActiveRecord::Migration
  def change
    add_reference :majors, :user, index: true, foreign_key: true
  end
end
