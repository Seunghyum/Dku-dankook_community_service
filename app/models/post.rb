class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :board

  default_scope {order('id DESC')}

  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
  #투표대상
  acts_as_votable

  #태그
  acts_as_taggable


  def self.search(search)
    if search
      where(["title LIKE ?","%#{search}%"])
    else
      all
    end
  end
end
