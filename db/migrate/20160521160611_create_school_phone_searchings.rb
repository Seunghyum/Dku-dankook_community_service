class CreateSchoolPhoneSearchings < ActiveRecord::Migration
  def change
    create_table :school_phone_searchings do |t|
      t.string :campus, default: ""
      t.string :belong, default: ""
      t.string :phone, default: ""
      t.string :name, default: ""

      t.timestamps null: false
    end
  end
end
