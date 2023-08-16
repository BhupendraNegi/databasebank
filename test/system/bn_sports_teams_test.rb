require "application_system_test_case"

class BnSportsTeamsTest < ApplicationSystemTestCase
  setup do
    @bn_sports_team = bn_sports_teams(:one)
  end

  test "visiting the index" do
    visit bn_sports_teams_url
    assert_selector "h1", text: "Bn sports teams"
  end

  test "should create bn sports team" do
    visit bn_sports_teams_url
    click_on "New bn sports team"

    click_on "Create Bn sports team"

    assert_text "Bn sports team was successfully created"
    click_on "Back"
  end

  test "should update Bn sports team" do
    visit bn_sports_team_url(@bn_sports_team)
    click_on "Edit this bn sports team", match: :first

    click_on "Update Bn sports team"

    assert_text "Bn sports team was successfully updated"
    click_on "Back"
  end

  test "should destroy Bn sports team" do
    visit bn_sports_team_url(@bn_sports_team)
    click_on "Destroy this bn sports team", match: :first

    assert_text "Bn sports team was successfully destroyed"
  end
end
