class HomeController < ApplicationController
  def index
    @meetings = Meeting.all

    #tag 출력
    @listing_tags = ActsAsTaggableOn::Tag.most_used(20).each_slice(2).to_a
    @listing_a = @listing_tags.first
    @listing_b = @listing_tags.second

    #태그 ui구현
    @samples = ["u", "blue", 'red', 'green', 'sea',
          'orange', 'yellow', 'purple', 'aqua',
          'brown', 'dark-blue', 'light-green', 'dark', 'light']

    respond_to do |format|
      format.js
      format.html
    end
  end
end
