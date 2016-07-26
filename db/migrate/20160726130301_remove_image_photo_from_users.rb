class RemoveImagePhotoFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :image, :string
    remove_column :users, :photo, :string
  end
end
