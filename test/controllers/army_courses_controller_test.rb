require "test_helper"

class ArmyCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @army_course = army_courses(:one)
  end

  test "should get index" do
    get army_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_army_course_url
    assert_response :success
  end

  test "should create army_course" do
    assert_difference("ArmyCourse.count") do
      post army_courses_url, params: { army_course: {  } }
    end

    assert_redirected_to army_course_url(ArmyCourse.last)
  end

  test "should show army_course" do
    get army_course_url(@army_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_army_course_url(@army_course)
    assert_response :success
  end

  test "should update army_course" do
    patch army_course_url(@army_course), params: { army_course: {  } }
    assert_redirected_to army_course_url(@army_course)
  end

  test "should destroy army_course" do
    assert_difference("ArmyCourse.count", -1) do
      delete army_course_url(@army_course)
    end

    assert_redirected_to army_courses_url
  end
end
