class Rehearsal < ActiveRecord::Base
  belongs_to :rehearsal_user
  belongs_to :rehearsal_lecture
end
