require "test_helper"

class AwardsAndAchievementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @awards_and_achievement = awards_and_achievements(:one)
  end

  test "should get index" do
    get awards_and_achievements_url
    assert_response :success
  end

  test "should get new" do
    get new_awards_and_achievement_url
    assert_response :success
  end

  test "should create awards_and_achievement" do
    assert_difference("AwardsAndAchievement.count") do
      post awards_and_achievements_url, params: { awards_and_achievement: {  } }
    end

    assert_redirected_to awards_and_achievement_url(AwardsAndAchievement.last)
  end

  test "should show awards_and_achievement" do
    get awards_and_achievement_url(@awards_and_achievement)
    assert_response :success
  end

  test "should get edit" do
    get edit_awards_and_achievement_url(@awards_and_achievement)
    assert_response :success
  end

  test "should update awards_and_achievement" do
    patch awards_and_achievement_url(@awards_and_achievement), params: { awards_and_achievement: {  } }
    assert_redirected_to awards_and_achievement_url(@awards_and_achievement)
  end

  test "should destroy awards_and_achievement" do
    assert_difference("AwardsAndAchievement.count", -1) do
      delete awards_and_achievement_url(@awards_and_achievement)
    end

    assert_redirected_to awards_and_achievements_url
  end
end
