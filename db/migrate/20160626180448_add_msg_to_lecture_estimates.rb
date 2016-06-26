class AddMsgToLectureEstimates < ActiveRecord::Migration
  def change
    add_column :lecture_estimates, :msg, :text
  end
end
