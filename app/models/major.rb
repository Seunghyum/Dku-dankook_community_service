class Major < ActiveRecord::Base
  has_many :users
  has_many :books
  has_one :locker
end
