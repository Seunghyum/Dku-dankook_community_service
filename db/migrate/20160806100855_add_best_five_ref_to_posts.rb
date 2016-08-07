class AddBestFiveRefToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :best_five, index: true, foreign_key: true
  end
end
