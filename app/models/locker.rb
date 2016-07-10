class Locker < ActiveRecord::Base
  belongs_to :major
  has_many :locker_particulars
  has_many :users, through: :locker_particulars
end
