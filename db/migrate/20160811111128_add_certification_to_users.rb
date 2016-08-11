class AddCertificationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :certification, :boolean, default: false
  end
end
