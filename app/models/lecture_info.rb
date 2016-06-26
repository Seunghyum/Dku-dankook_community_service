class LectureInfo < ActiveRecord::Base
  has_many :lecture_estimates
  belongs_to :professor
end
