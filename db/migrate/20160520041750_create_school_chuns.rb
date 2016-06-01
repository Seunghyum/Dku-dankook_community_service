class CreateSchoolChuns < ActiveRecord::Migration
  def change
    create_table :school_chuns do |t|
      t.string :belong
      t.string :name
      t.string :phone
      t.string :campus, default: "천안"

      t.timestamps null: false
    end
  end
end
