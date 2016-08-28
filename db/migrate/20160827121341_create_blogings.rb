class CreateBlogings < ActiveRecord::Migration
  def change
    create_table :blogings do |t|
      t.string :title
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.integer :hits, default: 0
      t.string :image

      t.timestamps null: false
    end
  end
end
