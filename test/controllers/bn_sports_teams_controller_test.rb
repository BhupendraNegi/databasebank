require "test_helper"

class BnSportsTeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bn_sports_team = bn_sports_teams(:one)
  end

  test "should get index" do
    get bn_sports_teams_url
    assert_response :success
  end

  test "should get new" do
    get new_bn_sports_team_url
    assert_response :success
  end

  test "should create bn_sports_team" do
    assert_difference("BnSportsTeam.count") do
      post bn_sports_teams_url, params: { bn_sports_team: {  } }
    end

    assert_redirected_to bn_sports_team_url(BnSportsTeam.last)
  end

  test "should show bn_sports_team" do
    get bn_sports_team_url(@bn_sports_team)
    assert_response :success
  end

  test "should get edit" do
    get edit_bn_sports_team_url(@bn_sports_team)
    assert_response :success
  end

  test "should update bn_sports_team" do
    patch bn_sports_team_url(@bn_sports_team), params: { bn_sports_team: {  } }
    assert_redirected_to bn_sports_team_url(@bn_sports_team)
  end

  test "should destroy bn_sports_team" do
    assert_difference("BnSportsTeam.count", -1) do
      delete bn_sports_team_url(@bn_sports_team)
    end

    assert_redirected_to bn_sports_teams_url
  end
end
