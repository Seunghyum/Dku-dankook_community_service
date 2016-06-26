class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :name
      t.string :belong
      t.string :intro_url

      t.timestamps null: false
    end
  end
end
