class Bloging < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  #투표대상
  acts_as_votable

  #태그
  acts_as_taggable_on :tags

  private
    def self.search(search)
      if search
        where(["title LIKE :search", search: "%#{search}%"])
      else
        all
      end
    end
end
