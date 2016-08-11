class HomeController < ApplicationController
  def index
    @meetings = Meeting.all
    @meeting_divide_2 = @meetings.in_groups_of(2)
    #tag 출력
    @listing_tags = ActsAsTaggableOn::Tag.most_used(20).each_slice(2).to_a
    @listing_a = @listing_tags.first
    @listing_b = @listing_tags.second

    #태그 ui구현
    @samples = ["u", "blue", 'red', 'green', 'sea',
          'orange', 'yellow', 'purple', 'aqua',
          'light-green']

    # 강의 순위
    @best_liberal = BestFive.find_by(category: "교양").lecture_infos

    @best_posts = BestFive.find_by(category: "자유게시판").posts.order("cached_votes_score DESC")
    # respond_to do |format|
    #   format.js
    #   format.html
    # end
    @professors_11 = Professor.order("cached_votes_score DESC").take(11)

  end

  def certify

  end
end
