require "application_system_test_case"

class AttPersTest < ApplicationSystemTestCase
  setup do
    @att_per = att_pers(:one)
  end

  test "visiting the index" do
    visit att_pers_url
    assert_selector "h1", text: "Att pers"
  end

  test "should create att per" do
    visit att_pers_url
    click_on "New att per"

    click_on "Create Att per"

    assert_text "Att per was successfully created"
    click_on "Back"
  end

  test "should update Att per" do
    visit att_per_url(@att_per)
    click_on "Edit this att per", match: :first

    click_on "Update Att per"

    assert_text "Att per was successfully updated"
    click_on "Back"
  end

  test "should destroy Att per" do
    visit att_per_url(@att_per)
    click_on "Destroy this att per", match: :first

    assert_text "Att per was successfully destroyed"
  end
end
