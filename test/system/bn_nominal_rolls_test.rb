require "application_system_test_case"

class BnNominalRollsTest < ApplicationSystemTestCase
  setup do
    @bn_nominal_roll = bn_nominal_rolls(:one)
  end

  test "visiting the index" do
    visit bn_nominal_rolls_url
    assert_selector "h1", text: "Bn nominal rolls"
  end

  test "should create bn nominal roll" do
    visit bn_nominal_rolls_url
    click_on "New bn nominal roll"

    click_on "Create Bn nominal roll"

    assert_text "Bn nominal roll was successfully created"
    click_on "Back"
  end

  test "should update Bn nominal roll" do
    visit bn_nominal_roll_url(@bn_nominal_roll)
    click_on "Edit this bn nominal roll", match: :first

    click_on "Update Bn nominal roll"

    assert_text "Bn nominal roll was successfully updated"
    click_on "Back"
  end

  test "should destroy Bn nominal roll" do
    visit bn_nominal_roll_url(@bn_nominal_roll)
    click_on "Destroy this bn nominal roll", match: :first

    assert_text "Bn nominal roll was successfully destroyed"
  end
end
