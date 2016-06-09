class PostsController < ApplicationController
  before_action :set_board
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  # GET /posts
  # GET /posts.json
  def index
    # @posts = @board.posts.all.page(params[:page]).per(20)
    @posts = @board.posts.search(params[:search]).page(params[:page]).per(20)
    respond_to do |format|
      format.js
      format.html 
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post.hits = @post.hits + 1
    @post.save
    # @all_posts = @board.posts.all
    # params_page = (@post.id / 20).to_i
    # @posts = @board.posts.all.page(params_page).per(20)
    # @posts = @board.posts.all.page(params[:page]).per(20)
    
    #좋아요 버튼 ajax -  up / down vote.js
    
    respond_to do |format|
    	format.html {
    	  #페이지 클릭 시 페이지네이션 + table 세팅
    	  pagination_per = 20
        @last_post = @board.posts.search(params[:search])
        last_post_id = @last_post.first.id
        post_id = @post.id
        num_of_last_pages = last_post_id % pagination_per
        first_post_id_except_last_page = last_post_id + (pagination_per - num_of_last_pages) 

        if (post_id - num_of_last_pages) % (pagination_per) == 0
          params_page = last_post_id / pagination_per - (post_id - num_of_last_pages) / (pagination_per) + 1
        else 
          params_page = last_post_id / pagination_per - (post_id - num_of_last_pages) / (pagination_per)
        end
        
        @posts = @last_post.page(params_page).per(pagination_per)
    	}
      format.js {
        # 페이지네이션 클릭 시
        @posts = @board.posts.all.page(params[:page]).per(20)
      }
    end
  end

  # GET /posts/new
  def new
    @post = @board.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @board.posts.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to [@post.board, @post]
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to [@post.board, @post]
    else
      render :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to board_posts_path(@post.board)
  end

  def upvote
    @post.upvote_from current_user
    respond_to do |format|
      format.html
      format.js
    end
  end

  def downvote
    @post.downvote_from current_user
    respond_to do |format|
      format.html
      format.js
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_board
      @board = Board.find(params[:board_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :attachment, :board_id)
    end
end
