class AddReviewToLectureInfos < ActiveRecord::Migration
  def change
    add_column :lecture_infos, :review, :string
  end
end
