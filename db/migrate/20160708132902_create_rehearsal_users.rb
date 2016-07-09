class CreateRehearsalUsers < ActiveRecord::Migration
  def change
    create_table :rehearsal_users do |t|
      t.string :user_ip

      t.timestamps null: false
    end
  end
end
