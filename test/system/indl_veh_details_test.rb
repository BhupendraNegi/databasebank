require "application_system_test_case"

class IndlVehDetailsTest < ApplicationSystemTestCase
  setup do
    @indl_veh_detail = indl_veh_details(:one)
  end

  test "visiting the index" do
    visit indl_veh_details_url
    assert_selector "h1", text: "Indl veh details"
  end

  test "should create indl veh detail" do
    visit indl_veh_details_url
    click_on "New indl veh detail"

    click_on "Create Indl veh detail"

    assert_text "Indl veh detail was successfully created"
    click_on "Back"
  end

  test "should update Indl veh detail" do
    visit indl_veh_detail_url(@indl_veh_detail)
    click_on "Edit this indl veh detail", match: :first

    click_on "Update Indl veh detail"

    assert_text "Indl veh detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Indl veh detail" do
    visit indl_veh_detail_url(@indl_veh_detail)
    click_on "Destroy this indl veh detail", match: :first

    assert_text "Indl veh detail was successfully destroyed"
  end
end
