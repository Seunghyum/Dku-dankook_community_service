require 'test_helper'

class LockerControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get manage" do
    get :manage
    assert_response :success
  end

  test "should get nottime" do
    get :nottime
    assert_response :success
  end

  test "should get reject" do
    get :reject
    assert_response :success
  end

  test "should get selecting" do
    get :selecting
    assert_response :success
  end

end
