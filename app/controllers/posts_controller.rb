class PostsController < ApplicationController
  before_action :set_board
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # GET /posts
  # GET /posts.json
  def index
    @posts = @board.posts.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show    
    @post.hits = @post.hits + 1
    @post.save
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
