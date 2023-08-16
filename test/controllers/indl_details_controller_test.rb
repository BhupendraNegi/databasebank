require "test_helper"

class IndlDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @indl_detail = indl_details(:one)
  end

  test "should get index" do
    get indl_details_url
    assert_response :success
  end

  test "should get new" do
    get new_indl_detail_url
    assert_response :success
  end

  test "should create indl_detail" do
    assert_difference("IndlDetail.count") do
      post indl_details_url, params: { indl_detail: {  } }
    end

    assert_redirected_to indl_detail_url(IndlDetail.last)
  end

  test "should show indl_detail" do
    get indl_detail_url(@indl_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_indl_detail_url(@indl_detail)
    assert_response :success
  end

  test "should update indl_detail" do
    patch indl_detail_url(@indl_detail), params: { indl_detail: {  } }
    assert_redirected_to indl_detail_url(@indl_detail)
  end

  test "should destroy indl_detail" do
    assert_difference("IndlDetail.count", -1) do
      delete indl_detail_url(@indl_detail)
    end

    assert_redirected_to indl_details_url
  end
end
