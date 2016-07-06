class CreateRehearsals < ActiveRecord::Migration
  def change
    create_table :rehearsals do |t|
      #수업신청자 숫자
      t.integer :counting, defalut: 0
      t.references :rehearsalible, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
