class BestFive < ActiveRecord::Base
  has_many :lecture_infos
  has_many :posts
end
