class LockerParticular < ActiveRecord::Base
  belongs_to :locker
  belongs_to :user
end
