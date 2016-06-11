class AddColsToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :photo, :string
    add_column :meetings, :display_tag, :string
    add_column :meetings, :end_time, :datetime
  end
end
