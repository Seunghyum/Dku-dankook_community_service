class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  
  validates :title, presence: true
  validates :content, presence: true
end
