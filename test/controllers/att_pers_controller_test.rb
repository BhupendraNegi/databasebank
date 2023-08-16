require "test_helper"

class AttPersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @att_per = att_pers(:one)
  end

  test "should get index" do
    get att_pers_url
    assert_response :success
  end

  test "should get new" do
    get new_att_per_url
    assert_response :success
  end

  test "should create att_per" do
    assert_difference("AttPer.count") do
      post att_pers_url, params: { att_per: {  } }
    end

    assert_redirected_to att_per_url(AttPer.last)
  end

  test "should show att_per" do
    get att_per_url(@att_per)
    assert_response :success
  end

  test "should get edit" do
    get edit_att_per_url(@att_per)
    assert_response :success
  end

  test "should update att_per" do
    patch att_per_url(@att_per), params: { att_per: {  } }
    assert_redirected_to att_per_url(@att_per)
  end

  test "should destroy att_per" do
    assert_difference("AttPer.count", -1) do
      delete att_per_url(@att_per)
    end

    assert_redirected_to att_pers_url
  end
end
