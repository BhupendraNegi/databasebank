require "test_helper"

class EreDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ere_detail = ere_details(:one)
  end

  test "should get index" do
    get ere_details_url
    assert_response :success
  end

  test "should get new" do
    get new_ere_detail_url
    assert_response :success
  end

  test "should create ere_detail" do
    assert_difference("EreDetail.count") do
      post ere_details_url, params: { ere_detail: {  } }
    end

    assert_redirected_to ere_detail_url(EreDetail.last)
  end

  test "should show ere_detail" do
    get ere_detail_url(@ere_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_ere_detail_url(@ere_detail)
    assert_response :success
  end

  test "should update ere_detail" do
    patch ere_detail_url(@ere_detail), params: { ere_detail: {  } }
    assert_redirected_to ere_detail_url(@ere_detail)
  end

  test "should destroy ere_detail" do
    assert_difference("EreDetail.count", -1) do
      delete ere_detail_url(@ere_detail)
    end

    assert_redirected_to ere_details_url
  end
end
