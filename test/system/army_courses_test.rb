require "application_system_test_case"

class ArmyCoursesTest < ApplicationSystemTestCase
  setup do
    @army_course = army_courses(:one)
  end

  test "visiting the index" do
    visit army_courses_url
    assert_selector "h1", text: "Army courses"
  end

  test "should create army course" do
    visit army_courses_url
    click_on "New army course"

    click_on "Create Army course"

    assert_text "Army course was successfully created"
    click_on "Back"
  end

  test "should update Army course" do
    visit army_course_url(@army_course)
    click_on "Edit this army course", match: :first

    click_on "Update Army course"

    assert_text "Army course was successfully updated"
    click_on "Back"
  end

  test "should destroy Army course" do
    visit army_course_url(@army_course)
    click_on "Destroy this army course", match: :first

    assert_text "Army course was successfully destroyed"
  end
end
