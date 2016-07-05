require 'test_helper'

class RehearsalsControllerTest < ActionController::TestCase
  setup do
    @rehearsal = rehearsals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rehearsals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rehearsal" do
    assert_difference('Rehearsal.count') do
      post :create, rehearsal: { l_type: @rehearsal.l_type, name: @rehearsal.name, ranking: @rehearsal.ranking, time: @rehearsal.time }
    end

    assert_redirected_to rehearsal_path(assigns(:rehearsal))
  end

  test "should show rehearsal" do
    get :show, id: @rehearsal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rehearsal
    assert_response :success
  end

  test "should update rehearsal" do
    patch :update, id: @rehearsal, rehearsal: { l_type: @rehearsal.l_type, name: @rehearsal.name, ranking: @rehearsal.ranking, time: @rehearsal.time }
    assert_redirected_to rehearsal_path(assigns(:rehearsal))
  end

  test "should destroy rehearsal" do
    assert_difference('Rehearsal.count', -1) do
      delete :destroy, id: @rehearsal
    end

    assert_redirected_to rehearsals_path
  end
end
