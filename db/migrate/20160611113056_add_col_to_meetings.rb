class AddColToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :event_type, :string
  end
end
