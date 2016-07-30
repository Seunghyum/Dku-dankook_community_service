class PickmeController < ApplicationController
  def index
    @professors = Professor.search_professor(params[:name])
  end

  def upvote
    @prof = Professor.find(params[:id])
    if current_user.find_up_voted_items.size < 3
      @prof.upvote_by current_user
      redirect_to :back
    # elsif current_user.voted_up_on? @prof
    #   current_user.get_down_voted Professor
    #   redirect_to :back
    else
      flash[:notice] = "최대 3번 투표할 수 있습니다."
      redirect_to :back
    end
  end

  def downvote
    @prof = Professor.find(params[:id])
    @prof.downvote_by current_user
    redirect_to :back
  end

end
