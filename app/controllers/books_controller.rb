class BooksController < ApplicationController

  layout "dku"
  #auth
  load_and_authorize_resource
  # authorize_resource :class => false
  # skip_authorize_resource :only => [:index, :show]

  before_action :set_book, only: [:edit, :update, :destroy, :purchase, :reject_purchase]
  before_action :set_book_list, only: [:edit, :update, :destroy, :purchase, :reject_purchase]
  def new
    @book = Book.new
  end

  def edit
  end

  def purchase
    @book.update(purchase: true)
    redirect_to book_list_path(@book_list)
  end

  def reject_purchase
    @book.update(purchase: false)
    redirect_to book_list_path(@book_list)
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_lists_path, notice: '책이 성공적으로 만들어졌습니다.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_list_path(@book_list), notice: '책이 성공적으로 삭제되었습니다.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to book_lists_path, notice: '책이 성공적으로 삭제되었습니다.' }
    end
  end

  private

    def set_book_list
      @book_list = BookList.find(params[:book_list_id])
    end

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:name, :price)
    end
end
