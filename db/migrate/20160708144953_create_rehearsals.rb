class CreateRehearsals < ActiveRecord::Migration
  def change
    create_table :rehearsals do |t|
      t.string :counting, default: 0
      t.references :rehearsal_user, index: true, foreign_key: true
      t.references :rehearsal_lecture, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
