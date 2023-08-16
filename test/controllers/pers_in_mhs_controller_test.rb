require "test_helper"

class PersInMhsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pers_in_mh = pers_in_mhs(:one)
  end

  test "should get index" do
    get pers_in_mhs_url
    assert_response :success
  end

  test "should get new" do
    get new_pers_in_mh_url
    assert_response :success
  end

  test "should create pers_in_mh" do
    assert_difference("PersInMh.count") do
      post pers_in_mhs_url, params: { pers_in_mh: {  } }
    end

    assert_redirected_to pers_in_mh_url(PersInMh.last)
  end

  test "should show pers_in_mh" do
    get pers_in_mh_url(@pers_in_mh)
    assert_response :success
  end

  test "should get edit" do
    get edit_pers_in_mh_url(@pers_in_mh)
    assert_response :success
  end

  test "should update pers_in_mh" do
    patch pers_in_mh_url(@pers_in_mh), params: { pers_in_mh: {  } }
    assert_redirected_to pers_in_mh_url(@pers_in_mh)
  end

  test "should destroy pers_in_mh" do
    assert_difference("PersInMh.count", -1) do
      delete pers_in_mh_url(@pers_in_mh)
    end

    assert_redirected_to pers_in_mhs_url
  end
end
