class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  #투표대상
  acts_as_votable
end
