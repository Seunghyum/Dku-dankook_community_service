class Blogings::CommentsController < CommentsController
	before_action :set_commentable, only: [:create]

	private
		def set_commentable
			@commentable = Bloging.find(params[:post_id])
		end
end
