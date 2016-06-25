class AddTipToLectureEstimates < ActiveRecord::Migration
  def change
    add_column :lecture_estimates, :tip, :text
  end
end
