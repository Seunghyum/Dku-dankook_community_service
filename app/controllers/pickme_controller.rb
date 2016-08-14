class PickmeController < ApplicationController

  before_action :set_professor, only: [:upvote, :downvote]

  def index
    if params[:name].nil? || params[:filter] == "전체"
      @professors = Professor.all
    else
      @search_professor = Professor.search_professor(params[:name])
    end
  end

  def show

  end

  def ranking
    @professors = Professor.order("cached_votes_score DESC")
    @professors_11 = @professors.take(11)

  end

  def intro

  end

  def upvote
    if current_user.votes.where(votable_type: "Professor", vote_flag: true).size < 3
      @prof.upvote_by current_user
      flash[:success] = "#{@prof.name} 교수님을 응원하셨습니다."
    elsif current_user.voted_up_on? @prof
      current_user.get_down_voted @prof
      flash[:warning] = "중복투표는 안됩니다."
    else
      flash[:warning] = "최대 3번까지만 가능합니다."
    end
    redirect_to :back
  end

  def downvote
    @prof.downvote_by current_user
    flash[:warning] = "#{@prof.name} 교수님께 한 응원을 취소하셨습니다."
    redirect_to :back
  end

  private
    def set_professor
      @prof = Professor.find(params[:id])
    end
end
