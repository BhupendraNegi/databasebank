require "application_system_test_case"

class AwardsAndAchievementsTest < ApplicationSystemTestCase
  setup do
    @awards_and_achievement = awards_and_achievements(:one)
  end

  test "visiting the index" do
    visit awards_and_achievements_url
    assert_selector "h1", text: "Awards and achievements"
  end

  test "should create awards and achievement" do
    visit awards_and_achievements_url
    click_on "New awards and achievement"

    click_on "Create Awards and achievement"

    assert_text "Awards and achievement was successfully created"
    click_on "Back"
  end

  test "should update Awards and achievement" do
    visit awards_and_achievement_url(@awards_and_achievement)
    click_on "Edit this awards and achievement", match: :first

    click_on "Update Awards and achievement"

    assert_text "Awards and achievement was successfully updated"
    click_on "Back"
  end

  test "should destroy Awards and achievement" do
    visit awards_and_achievement_url(@awards_and_achievement)
    click_on "Destroy this awards and achievement", match: :first

    assert_text "Awards and achievement was successfully destroyed"
  end
end
