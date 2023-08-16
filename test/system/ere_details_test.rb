require "application_system_test_case"

class EreDetailsTest < ApplicationSystemTestCase
  setup do
    @ere_detail = ere_details(:one)
  end

  test "visiting the index" do
    visit ere_details_url
    assert_selector "h1", text: "Ere details"
  end

  test "should create ere detail" do
    visit ere_details_url
    click_on "New ere detail"

    click_on "Create Ere detail"

    assert_text "Ere detail was successfully created"
    click_on "Back"
  end

  test "should update Ere detail" do
    visit ere_detail_url(@ere_detail)
    click_on "Edit this ere detail", match: :first

    click_on "Update Ere detail"

    assert_text "Ere detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Ere detail" do
    visit ere_detail_url(@ere_detail)
    click_on "Destroy this ere detail", match: :first

    assert_text "Ere detail was successfully destroyed"
  end
end
