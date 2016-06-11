class HomeController < ApplicationController
  def index
    @meetings = Meeting.all
    respond_to do |format|
      format.js
      format.html 
    end
  end
end
