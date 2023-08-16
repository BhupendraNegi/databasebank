require "application_system_test_case"

class BnLmcPersTest < ApplicationSystemTestCase
  setup do
    @bn_lmc_per = bn_lmc_pers(:one)
  end

  test "visiting the index" do
    visit bn_lmc_pers_url
    assert_selector "h1", text: "Bn lmc pers"
  end

  test "should create bn lmc per" do
    visit bn_lmc_pers_url
    click_on "New bn lmc per"

    fill_in "Bnnominalroll", with: @bn_lmc_per.BnNominalRoll_id
    click_on "Create Bn lmc per"

    assert_text "Bn lmc per was successfully created"
    click_on "Back"
  end

  test "should update Bn lmc per" do
    visit bn_lmc_per_url(@bn_lmc_per)
    click_on "Edit this bn lmc per", match: :first

    fill_in "Bnnominalroll", with: @bn_lmc_per.BnNominalRoll_id
    click_on "Update Bn lmc per"

    assert_text "Bn lmc per was successfully updated"
    click_on "Back"
  end

  test "should destroy Bn lmc per" do
    visit bn_lmc_per_url(@bn_lmc_per)
    click_on "Destroy this bn lmc per", match: :first

    assert_text "Bn lmc per was successfully destroyed"
  end
end
