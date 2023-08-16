require "application_system_test_case"

class BnPunishmentPersTest < ApplicationSystemTestCase
  setup do
    @bn_punishment_per = bn_punishment_pers(:one)
  end

  test "visiting the index" do
    visit bn_punishment_pers_url
    assert_selector "h1", text: "Bn punishment pers"
  end

  test "should create bn punishment per" do
    visit bn_punishment_pers_url
    click_on "New bn punishment per"

    click_on "Create Bn punishment per"

    assert_text "Bn punishment per was successfully created"
    click_on "Back"
  end

  test "should update Bn punishment per" do
    visit bn_punishment_per_url(@bn_punishment_per)
    click_on "Edit this bn punishment per", match: :first

    click_on "Update Bn punishment per"

    assert_text "Bn punishment per was successfully updated"
    click_on "Back"
  end

  test "should destroy Bn punishment per" do
    visit bn_punishment_per_url(@bn_punishment_per)
    click_on "Destroy this bn punishment per", match: :first

    assert_text "Bn punishment per was successfully destroyed"
  end
end
