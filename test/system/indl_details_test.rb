require "application_system_test_case"

class IndlDetailsTest < ApplicationSystemTestCase
  setup do
    @indl_detail = indl_details(:one)
  end

  test "visiting the index" do
    visit indl_details_url
    assert_selector "h1", text: "Indl details"
  end

  test "should create indl detail" do
    visit indl_details_url
    click_on "New indl detail"

    click_on "Create Indl detail"

    assert_text "Indl detail was successfully created"
    click_on "Back"
  end

  test "should update Indl detail" do
    visit indl_detail_url(@indl_detail)
    click_on "Edit this indl detail", match: :first

    click_on "Update Indl detail"

    assert_text "Indl detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Indl detail" do
    visit indl_detail_url(@indl_detail)
    click_on "Destroy this indl detail", match: :first

    assert_text "Indl detail was successfully destroyed"
  end
end
