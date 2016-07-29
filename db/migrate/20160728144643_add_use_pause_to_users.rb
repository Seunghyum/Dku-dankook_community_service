class AddUsePauseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :use_pause, :boolean, default: false
  end
end
