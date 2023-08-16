require "application_system_test_case"

class LeaveStatesTest < ApplicationSystemTestCase
  setup do
    @leave_state = leave_states(:one)
  end

  test "visiting the index" do
    visit leave_states_url
    assert_selector "h1", text: "Leave states"
  end

  test "should create leave state" do
    visit leave_states_url
    click_on "New leave state"

    click_on "Create Leave state"

    assert_text "Leave state was successfully created"
    click_on "Back"
  end

  test "should update Leave state" do
    visit leave_state_url(@leave_state)
    click_on "Edit this leave state", match: :first

    click_on "Update Leave state"

    assert_text "Leave state was successfully updated"
    click_on "Back"
  end

  test "should destroy Leave state" do
    visit leave_state_url(@leave_state)
    click_on "Destroy this leave state", match: :first

    assert_text "Leave state was successfully destroyed"
  end
end
