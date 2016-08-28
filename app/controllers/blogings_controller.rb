class BlogingsController < InheritedResources::Base
  #auth
  load_and_authorize_resource
  before_action :set_bloging, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    @blogings = Bloging.order("created_at DESC").search(params[:search]).page(params[:page]).per(20)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @bloging.hits = @bloging.hits + 1
    @bloging.save
    @samples = ["red", "green", "blue"]
  end

  def new
    @bloging = Bloging.new
  end

  def edit
  end

  def create
    @bloging = Bloging.new(bloging_params)
    @bloging.user = current_user
    if @bloging.save
      redirect_to @bloging
    else
      render :new
    end
  end

  # PATCH/PUT /blogings/1
  # PATCH/PUT /blogings/1.json
  def update
    if @bloging.update(bloging_params)
      redirect_to @bloging
    else
      render :edit
    end
  end

  # DELETE /blogings/1
  # DELETE /blogings/1.json
  def destroy
    @bloging.destroy
    redirect_to blogings_path
  end

  def upvote
    @bloging.upvote_from current_user
    respond_to do |format|
      format.html
      format.js
    end
  end

  def downvote
    @bloging.downvote_from current_user
    respond_to do |format|
      format.html
      format.js
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bloging
      @bloging = Bloging.find(params[:id])
    end

    def bloging_params
      params.require(:bloging).permit(:title, :body, :hits, :image, :tag_list)
    end
end
