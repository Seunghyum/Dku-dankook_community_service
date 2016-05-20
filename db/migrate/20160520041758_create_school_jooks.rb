class CreateSchoolJooks < ActiveRecord::Migration
  def change
    create_table :school_jooks do |t|
      t.string :belong
      t.string :name
      t.string :phone

      t.timestamps null: false
    end
  end
end
