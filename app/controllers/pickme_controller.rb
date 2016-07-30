class PickmeController < ApplicationController
  def index
    @professors = Professor.search_professor(params[:name])
  end
end
