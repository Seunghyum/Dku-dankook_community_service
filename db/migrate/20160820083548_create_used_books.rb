class CreateUsedBooks < ActiveRecord::Migration
  def change
    create_table :used_books do |t|
      t.string :btitle
      t.string :bgiver
      t.string :n_edition
      t.string :real_or_copy
      t.references :user, index: true, foreign_key: true
      t.references :major, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
