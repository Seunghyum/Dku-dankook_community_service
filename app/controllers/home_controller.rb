class HomeController < ApplicationController
  #auth
  load_and_authorize_resource
  def index
    @meetings = Meeting.all
    respond_to do |format|
      format.js
      format.html
    end
  end
end
