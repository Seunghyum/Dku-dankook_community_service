class Professor < ActiveRecord::Base
  has_many :lecture_infos
end
