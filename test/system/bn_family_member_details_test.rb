require "application_system_test_case"

class BnFamilyMemberDetailsTest < ApplicationSystemTestCase
  setup do
    @bn_family_member_detail = bn_family_member_details(:one)
  end

  test "visiting the index" do
    visit bn_family_member_details_url
    assert_selector "h1", text: "Bn family member details"
  end

  test "should create bn family member detail" do
    visit bn_family_member_details_url
    click_on "New bn family member detail"

    click_on "Create Bn family member detail"

    assert_text "Bn family member detail was successfully created"
    click_on "Back"
  end

  test "should update Bn family member detail" do
    visit bn_family_member_detail_url(@bn_family_member_detail)
    click_on "Edit this bn family member detail", match: :first

    click_on "Update Bn family member detail"

    assert_text "Bn family member detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Bn family member detail" do
    visit bn_family_member_detail_url(@bn_family_member_detail)
    click_on "Destroy this bn family member detail", match: :first

    assert_text "Bn family member detail was successfully destroyed"
  end
end
