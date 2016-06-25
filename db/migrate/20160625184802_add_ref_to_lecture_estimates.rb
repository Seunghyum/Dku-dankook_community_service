class AddRefToLectureEstimates < ActiveRecord::Migration
  def change
    add_reference :lecture_estimates, :user, index: true, foreign_key: true
  end
end
