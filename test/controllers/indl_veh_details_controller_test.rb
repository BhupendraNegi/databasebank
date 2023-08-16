require "test_helper"

class IndlVehDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @indl_veh_detail = indl_veh_details(:one)
  end

  test "should get index" do
    get indl_veh_details_url
    assert_response :success
  end

  test "should get new" do
    get new_indl_veh_detail_url
    assert_response :success
  end

  test "should create indl_veh_detail" do
    assert_difference("IndlVehDetail.count") do
      post indl_veh_details_url, params: { indl_veh_detail: {  } }
    end

    assert_redirected_to indl_veh_detail_url(IndlVehDetail.last)
  end

  test "should show indl_veh_detail" do
    get indl_veh_detail_url(@indl_veh_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_indl_veh_detail_url(@indl_veh_detail)
    assert_response :success
  end

  test "should update indl_veh_detail" do
    patch indl_veh_detail_url(@indl_veh_detail), params: { indl_veh_detail: {  } }
    assert_redirected_to indl_veh_detail_url(@indl_veh_detail)
  end

  test "should destroy indl_veh_detail" do
    assert_difference("IndlVehDetail.count", -1) do
      delete indl_veh_detail_url(@indl_veh_detail)
    end

    assert_redirected_to indl_veh_details_url
  end
end
