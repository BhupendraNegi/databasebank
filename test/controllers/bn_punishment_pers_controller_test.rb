require "test_helper"

class BnPunishmentPersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bn_punishment_per = bn_punishment_pers(:one)
  end

  test "should get index" do
    get bn_punishment_pers_url
    assert_response :success
  end

  test "should get new" do
    get new_bn_punishment_per_url
    assert_response :success
  end

  test "should create bn_punishment_per" do
    assert_difference("BnPunishmentPer.count") do
      post bn_punishment_pers_url, params: { bn_punishment_per: {  } }
    end

    assert_redirected_to bn_punishment_per_url(BnPunishmentPer.last)
  end

  test "should show bn_punishment_per" do
    get bn_punishment_per_url(@bn_punishment_per)
    assert_response :success
  end

  test "should get edit" do
    get edit_bn_punishment_per_url(@bn_punishment_per)
    assert_response :success
  end

  test "should update bn_punishment_per" do
    patch bn_punishment_per_url(@bn_punishment_per), params: { bn_punishment_per: {  } }
    assert_redirected_to bn_punishment_per_url(@bn_punishment_per)
  end

  test "should destroy bn_punishment_per" do
    assert_difference("BnPunishmentPer.count", -1) do
      delete bn_punishment_per_url(@bn_punishment_per)
    end

    assert_redirected_to bn_punishment_pers_url
  end
end
