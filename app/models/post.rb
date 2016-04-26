class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  
  has_many :comments, as: :commentable, dependent: :destroy
  
  validates :title, presence: true
  validates :content, presence: true
end
