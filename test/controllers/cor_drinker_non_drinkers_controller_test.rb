require "test_helper"

class CorDrinkerNonDrinkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cor_drinker_non_drinker = cor_drinker_non_drinkers(:one)
  end

  test "should get index" do
    get cor_drinker_non_drinkers_url
    assert_response :success
  end

  test "should get new" do
    get new_cor_drinker_non_drinker_url
    assert_response :success
  end

  test "should create cor_drinker_non_drinker" do
    assert_difference("CorDrinkerNonDrinker.count") do
      post cor_drinker_non_drinkers_url, params: { cor_drinker_non_drinker: {  } }
    end

    assert_redirected_to cor_drinker_non_drinker_url(CorDrinkerNonDrinker.last)
  end

  test "should show cor_drinker_non_drinker" do
    get cor_drinker_non_drinker_url(@cor_drinker_non_drinker)
    assert_response :success
  end

  test "should get edit" do
    get edit_cor_drinker_non_drinker_url(@cor_drinker_non_drinker)
    assert_response :success
  end

  test "should update cor_drinker_non_drinker" do
    patch cor_drinker_non_drinker_url(@cor_drinker_non_drinker), params: { cor_drinker_non_drinker: {  } }
    assert_redirected_to cor_drinker_non_drinker_url(@cor_drinker_non_drinker)
  end

  test "should destroy cor_drinker_non_drinker" do
    assert_difference("CorDrinkerNonDrinker.count", -1) do
      delete cor_drinker_non_drinker_url(@cor_drinker_non_drinker)
    end

    assert_redirected_to cor_drinker_non_drinkers_url
  end
end
