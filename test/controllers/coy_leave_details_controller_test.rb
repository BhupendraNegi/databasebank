require "test_helper"

class CoyLeaveDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coy_leave_detail = coy_leave_details(:one)
  end

  test "should get index" do
    get coy_leave_details_url
    assert_response :success
  end

  test "should get new" do
    get new_coy_leave_detail_url
    assert_response :success
  end

  test "should create coy_leave_detail" do
    assert_difference("CoyLeaveDetail.count") do
      post coy_leave_details_url, params: { coy_leave_detail: {  } }
    end

    assert_redirected_to coy_leave_detail_url(CoyLeaveDetail.last)
  end

  test "should show coy_leave_detail" do
    get coy_leave_detail_url(@coy_leave_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_coy_leave_detail_url(@coy_leave_detail)
    assert_response :success
  end

  test "should update coy_leave_detail" do
    patch coy_leave_detail_url(@coy_leave_detail), params: { coy_leave_detail: {  } }
    assert_redirected_to coy_leave_detail_url(@coy_leave_detail)
  end

  test "should destroy coy_leave_detail" do
    assert_difference("CoyLeaveDetail.count", -1) do
      delete coy_leave_detail_url(@coy_leave_detail)
    end

    assert_redirected_to coy_leave_details_url
  end
end
