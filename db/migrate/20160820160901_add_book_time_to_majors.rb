class AddBookTimeToMajors < ActiveRecord::Migration
  def change
    add_column :majors, :book_start_time, :datetime
    add_column :majors, :book_end_time, :datetime
  end
end
