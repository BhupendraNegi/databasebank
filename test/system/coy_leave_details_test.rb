require "application_system_test_case"

class CoyLeaveDetailsTest < ApplicationSystemTestCase
  setup do
    @coy_leave_detail = coy_leave_details(:one)
  end

  test "visiting the index" do
    visit coy_leave_details_url
    assert_selector "h1", text: "Coy leave details"
  end

  test "should create coy leave detail" do
    visit coy_leave_details_url
    click_on "New coy leave detail"

    click_on "Create Coy leave detail"

    assert_text "Coy leave detail was successfully created"
    click_on "Back"
  end

  test "should update Coy leave detail" do
    visit coy_leave_detail_url(@coy_leave_detail)
    click_on "Edit this coy leave detail", match: :first

    click_on "Update Coy leave detail"

    assert_text "Coy leave detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Coy leave detail" do
    visit coy_leave_detail_url(@coy_leave_detail)
    click_on "Destroy this coy leave detail", match: :first

    assert_text "Coy leave detail was successfully destroyed"
  end
end
