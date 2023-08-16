require "test_helper"

class BnFamilyMemberDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bn_family_member_detail = bn_family_member_details(:one)
  end

  test "should get index" do
    get bn_family_member_details_url
    assert_response :success
  end

  test "should get new" do
    get new_bn_family_member_detail_url
    assert_response :success
  end

  test "should create bn_family_member_detail" do
    assert_difference("BnFamilyMemberDetail.count") do
      post bn_family_member_details_url, params: { bn_family_member_detail: {  } }
    end

    assert_redirected_to bn_family_member_detail_url(BnFamilyMemberDetail.last)
  end

  test "should show bn_family_member_detail" do
    get bn_family_member_detail_url(@bn_family_member_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_bn_family_member_detail_url(@bn_family_member_detail)
    assert_response :success
  end

  test "should update bn_family_member_detail" do
    patch bn_family_member_detail_url(@bn_family_member_detail), params: { bn_family_member_detail: {  } }
    assert_redirected_to bn_family_member_detail_url(@bn_family_member_detail)
  end

  test "should destroy bn_family_member_detail" do
    assert_difference("BnFamilyMemberDetail.count", -1) do
      delete bn_family_member_detail_url(@bn_family_member_detail)
    end

    assert_redirected_to bn_family_member_details_url
  end
end
