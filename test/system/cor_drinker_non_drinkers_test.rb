require "application_system_test_case"

class CorDrinkerNonDrinkersTest < ApplicationSystemTestCase
  setup do
    @cor_drinker_non_drinker = cor_drinker_non_drinkers(:one)
  end

  test "visiting the index" do
    visit cor_drinker_non_drinkers_url
    assert_selector "h1", text: "Cor drinker non drinkers"
  end

  test "should create cor drinker non drinker" do
    visit cor_drinker_non_drinkers_url
    click_on "New cor drinker non drinker"

    click_on "Create Cor drinker non drinker"

    assert_text "Cor drinker non drinker was successfully created"
    click_on "Back"
  end

  test "should update Cor drinker non drinker" do
    visit cor_drinker_non_drinker_url(@cor_drinker_non_drinker)
    click_on "Edit this cor drinker non drinker", match: :first

    click_on "Update Cor drinker non drinker"

    assert_text "Cor drinker non drinker was successfully updated"
    click_on "Back"
  end

  test "should destroy Cor drinker non drinker" do
    visit cor_drinker_non_drinker_url(@cor_drinker_non_drinker)
    click_on "Destroy this cor drinker non drinker", match: :first

    assert_text "Cor drinker non drinker was successfully destroyed"
  end
end
