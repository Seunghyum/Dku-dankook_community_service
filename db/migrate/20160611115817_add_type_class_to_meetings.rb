class AddTypeClassToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :type_class, :string
  end
end
