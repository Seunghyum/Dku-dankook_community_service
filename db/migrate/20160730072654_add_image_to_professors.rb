class AddImageToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :profile, :string
  end
end
