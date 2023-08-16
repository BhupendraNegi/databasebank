require "test_helper"

class BnLmcPersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bn_lmc_per = bn_lmc_pers(:one)
  end

  test "should get index" do
    get bn_lmc_pers_url
    assert_response :success
  end

  test "should get new" do
    get new_bn_lmc_per_url
    assert_response :success
  end

  test "should create bn_lmc_per" do
    assert_difference("BnLmcPer.count") do
      post bn_lmc_pers_url, params: { bn_lmc_per: { BnNominalRoll_id: @bn_lmc_per.BnNominalRoll_id } }
    end

    assert_redirected_to bn_lmc_per_url(BnLmcPer.last)
  end

  test "should show bn_lmc_per" do
    get bn_lmc_per_url(@bn_lmc_per)
    assert_response :success
  end

  test "should get edit" do
    get edit_bn_lmc_per_url(@bn_lmc_per)
    assert_response :success
  end

  test "should update bn_lmc_per" do
    patch bn_lmc_per_url(@bn_lmc_per), params: { bn_lmc_per: { BnNominalRoll_id: @bn_lmc_per.BnNominalRoll_id } }
    assert_redirected_to bn_lmc_per_url(@bn_lmc_per)
  end

  test "should destroy bn_lmc_per" do
    assert_difference("BnLmcPer.count", -1) do
      delete bn_lmc_per_url(@bn_lmc_per)
    end

    assert_redirected_to bn_lmc_pers_url
  end
end
