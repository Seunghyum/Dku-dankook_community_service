class RehearsalUser < ActiveRecord::Base
  has_many :rehearsals
  has_many :rehearsal_lectures, through: :rehearsals
end
