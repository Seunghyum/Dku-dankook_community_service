class RemoveUesrIdFromMajors < ActiveRecord::Migration
  def change
    remove_reference :majors, :user, index: true, foreign_key: true
  end
end
