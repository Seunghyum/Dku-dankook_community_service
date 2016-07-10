class Book < ActiveRecord::Base
  belongs_to :major
  has_many :users, through: :bookables
end
