class RehearsalLecture < ActiveRecord::Base
  has_many :rehearsals
  has_many :rehearsal_users, through: :rehearsals
end
