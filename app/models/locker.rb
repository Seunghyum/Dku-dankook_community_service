class Locker < ActiveRecord::Base
  belongs_to :major
  # has_many :locker_particulars
  # has_many :majors, through: :locker_particulars
  before_save :check_role

  def check_role
  end
end
