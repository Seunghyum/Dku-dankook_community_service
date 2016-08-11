class AddOperatorToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :operator, :string
  end
end
