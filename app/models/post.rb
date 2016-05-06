class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :board

  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
  #투표대상
  acts_as_votable
end
