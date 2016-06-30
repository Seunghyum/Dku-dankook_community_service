class RemoveTipFromLectureEstimates < ActiveRecord::Migration
  def change
    remove_column :lecture_estimates, :tip, :text
  end
end
