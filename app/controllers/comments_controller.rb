class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy, :upvote, :downvote]

  def create
  	@comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
  	@comment.save
  	redirect_to :back
  end

  def destroy
    @comment.destroy
    redirect_to :back
  end

  def update
    @comment.update(comment_params)
    redirect_to :back
  end

  def upvote
    @comment.upvote_from current_user
    redirect_to :back
  end

  def downvote
    @comment.downvote_from current_user
    redirect_to :back
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :parent_id)
    end
end
