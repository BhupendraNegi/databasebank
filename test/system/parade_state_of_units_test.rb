require "application_system_test_case"

class ParadeStateOfUnitsTest < ApplicationSystemTestCase
  setup do
    @parade_state_of_unit = parade_state_of_units(:one)
  end

  test "visiting the index" do
    visit parade_state_of_units_url
    assert_selector "h1", text: "Parade state of units"
  end

  test "should create parade state of unit" do
    visit parade_state_of_units_url
    click_on "New parade state of unit"

    click_on "Create Parade state of unit"

    assert_text "Parade state of unit was successfully created"
    click_on "Back"
  end

  test "should update Parade state of unit" do
    visit parade_state_of_unit_url(@parade_state_of_unit)
    click_on "Edit this parade state of unit", match: :first

    click_on "Update Parade state of unit"

    assert_text "Parade state of unit was successfully updated"
    click_on "Back"
  end

  test "should destroy Parade state of unit" do
    visit parade_state_of_unit_url(@parade_state_of_unit)
    click_on "Destroy this parade state of unit", match: :first

    assert_text "Parade state of unit was successfully destroyed"
  end
end
