class BooksController < ApplicationController

  #auth
  # load_and_authorize_resource
  # authorize_resource :class => false
  # skip_authorize_resource :only => :searching

  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_book_list, only: [:show, :edit, :update, :destroy]

  def index
    @book_lists = BookList.search(params[:name])
    @book_list = BookList.new
    # @search_books = SearchBook.all
  end

  def show
    @books = @book_list.books
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to action: "index", notice: 'Book was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
    end
  end

  private

    def set_book_list
      @book_list = BookList.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:name, :bgiver, :price)
    end

    def search_params
      params.require(:book_list).permit(:name)
    end
end
