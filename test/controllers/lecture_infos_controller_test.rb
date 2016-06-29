require 'test_helper'

class LectureInfosControllerTest < ActionController::TestCase
  setup do
    @lecture_info = lecture_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lecture_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lecture_info" do
    assert_difference('LectureInfo.count') do
      post :create, lecture_info: { average: @lecture_info.average, l_type: @lecture_info.l_type, name: @lecture_info.name, professor_id: @lecture_info.professor_id, semester: @lecture_info.semester, time: @lecture_info.time }
    end

    assert_redirected_to lecture_info_path(assigns(:lecture_info))
  end

  test "should show lecture_info" do
    get :show, id: @lecture_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lecture_info
    assert_response :success
  end

  test "should update lecture_info" do
    patch :update, id: @lecture_info, lecture_info: { average: @lecture_info.average, l_type: @lecture_info.l_type, name: @lecture_info.name, professor_id: @lecture_info.professor_id, semester: @lecture_info.semester, time: @lecture_info.time }
    assert_redirected_to lecture_info_path(assigns(:lecture_info))
  end

  test "should destroy lecture_info" do
    assert_difference('LectureInfo.count', -1) do
      delete :destroy, id: @lecture_info
    end

    assert_redirected_to lecture_infos_path
  end
end
