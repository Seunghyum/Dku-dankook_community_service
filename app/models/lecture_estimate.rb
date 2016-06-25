class LectureEstimate < ActiveRecord::Base
  belongs_to :user
  belongs_to :lecture_info
end
