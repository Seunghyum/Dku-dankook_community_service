class BooksController < ApplicationController

  #auth
  load_and_authorize_resource
  # authorize_resource :class => false
  # skip_authorize_resource :only => :searching

  before_action :set_book, only: [:edit, :update, :destroy]
  before_action :set_book_list, only: [:edit, :update, :destroy]
  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_lists_path, notice: 'Book was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_list_path(@book_list), notice: 'Book was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to book_list_path(@book_list), notice: 'Book was successfully destroyed.' }
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
      params.require(:book).permit(:name, :bgiver, :price)
    end
end
