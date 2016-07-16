class Bookable < ActiveRecord::Base
  belongs_to :student_book
  belongs_to :user
end
