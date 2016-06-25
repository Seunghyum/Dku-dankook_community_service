require 'test_helper'

class LectureEstimatesControllerTest < ActionController::TestCase
  setup do
    @lecture_estimate = lecture_estimates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lecture_estimates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lecture_estimate" do
    assert_difference('LectureEstimate.count') do
      post :create, lecture_estimate: { all_view: @lecture_estimate.all_view, average: @lecture_estimate.average, female_view: @lecture_estimate.female_view, fun: @lecture_estimate.fun, get_grade: @lecture_estimate.get_grade, grade_nego: @lecture_estimate.grade_nego, male_view: @lecture_estimate.male_view, reason: @lecture_estimate.reason, teaching: @lecture_estimate.teaching }
    end

    assert_redirected_to lecture_estimate_path(assigns(:lecture_estimate))
  end

  test "should show lecture_estimate" do
    get :show, id: @lecture_estimate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lecture_estimate
    assert_response :success
  end

  test "should update lecture_estimate" do
    patch :update, id: @lecture_estimate, lecture_estimate: { all_view: @lecture_estimate.all_view, average: @lecture_estimate.average, female_view: @lecture_estimate.female_view, fun: @lecture_estimate.fun, get_grade: @lecture_estimate.get_grade, grade_nego: @lecture_estimate.grade_nego, male_view: @lecture_estimate.male_view, reason: @lecture_estimate.reason, teaching: @lecture_estimate.teaching }
    assert_redirected_to lecture_estimate_path(assigns(:lecture_estimate))
  end

  test "should destroy lecture_estimate" do
    assert_difference('LectureEstimate.count', -1) do
      delete :destroy, id: @lecture_estimate
    end

    assert_redirected_to lecture_estimates_path
  end
end
