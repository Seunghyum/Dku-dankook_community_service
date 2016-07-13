class CreateLockerParticulars < ActiveRecord::Migration
  def change
    create_table :locker_particulars do |t|
      t.references :locker, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :type, default: "일반"

      t.timestamps null: false
    end
  end
end
