class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :attachment
      t.references :user, index: true, foreign_key: true
      t.integer :hits, default: 0

      t.timestamps null: false
    end
  end
end
