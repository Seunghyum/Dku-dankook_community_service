class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :board
  belongs_to :best_five

  # default_scope {order('created_at DESC')}

  after_update do
    if is_post_limit && cached_votes_score_changed?
      post_best_ranking
    end
  end


  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
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


    def is_post_limit
      self.board.posts.length > 7
    end

    def post_best_ranking
      best_category = BestFive.find_by(category: self.board.name)
      # if ActsAsVotable::Vote.all.length % 7 == 0
        if best_category.posts.present?
          best_category.posts.each do |post|
            post.update_column(:best_five_id, nil)
          end
        end
        best_5 = self.board.posts.unscoped.order("cached_votes_score DESC").take(7)
        best_5.each do |best|
          best.update_column(:best_five_id, best_category.id)
        end
      # end
    end
end
