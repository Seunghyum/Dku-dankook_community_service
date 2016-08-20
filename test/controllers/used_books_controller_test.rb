require 'test_helper'

class UsedBooksControllerTest < ActionController::TestCase
  setup do
    @used_book = used_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:used_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create used_book" do
    assert_difference('UsedBook.count') do
      post :create, used_book: { bgiver: @used_book.bgiver, btitle: @used_book.btitle, major_id: @used_book.major_id, n_edition: @used_book.n_edition, real_or_copy: @used_book.real_or_copy, user_id: @used_book.user_id }
    end

    assert_redirected_to used_book_path(assigns(:used_book))
  end

  test "should show used_book" do
    get :show, id: @used_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @used_book
    assert_response :success
  end

  test "should update used_book" do
    patch :update, id: @used_book, used_book: { bgiver: @used_book.bgiver, btitle: @used_book.btitle, major_id: @used_book.major_id, n_edition: @used_book.n_edition, real_or_copy: @used_book.real_or_copy, user_id: @used_book.user_id }
    assert_redirected_to used_book_path(assigns(:used_book))
  end

  test "should destroy used_book" do
    assert_difference('UsedBook.count', -1) do
      delete :destroy, id: @used_book
    end

    assert_redirected_to used_books_path
  end
end
