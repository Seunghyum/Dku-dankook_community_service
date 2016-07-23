class Major < ActiveRecord::Base
  has_many :users
  has_one :locker
  # has_many :locker_particulars
  # has_many :locker, through: :locker_particulars
end
