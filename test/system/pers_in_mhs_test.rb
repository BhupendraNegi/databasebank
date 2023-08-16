require "application_system_test_case"

class PersInMhsTest < ApplicationSystemTestCase
  setup do
    @pers_in_mh = pers_in_mhs(:one)
  end

  test "visiting the index" do
    visit pers_in_mhs_url
    assert_selector "h1", text: "Pers in mhs"
  end

  test "should create pers in mh" do
    visit pers_in_mhs_url
    click_on "New pers in mh"

    click_on "Create Pers in mh"

    assert_text "Pers in mh was successfully created"
    click_on "Back"
  end

  test "should update Pers in mh" do
    visit pers_in_mh_url(@pers_in_mh)
    click_on "Edit this pers in mh", match: :first

    click_on "Update Pers in mh"

    assert_text "Pers in mh was successfully updated"
    click_on "Back"
  end

  test "should destroy Pers in mh" do
    visit pers_in_mh_url(@pers_in_mh)
    click_on "Destroy this pers in mh", match: :first

    assert_text "Pers in mh was successfully destroyed"
  end
end
