require "test_helper"

class BnNominalRollsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bn_nominal_roll = bn_nominal_rolls(:one)
  end

  test "should get index" do
    get bn_nominal_rolls_url
    assert_response :success
  end

  test "should get new" do
    get new_bn_nominal_roll_url
    assert_response :success
  end

  test "should create bn_nominal_roll" do
    assert_difference("BnNominalRoll.count") do
      post bn_nominal_rolls_url, params: { bn_nominal_roll: {  } }
    end

    assert_redirected_to bn_nominal_roll_url(BnNominalRoll.last)
  end

  test "should show bn_nominal_roll" do
    get bn_nominal_roll_url(@bn_nominal_roll)
    assert_response :success
  end

  test "should get edit" do
    get edit_bn_nominal_roll_url(@bn_nominal_roll)
    assert_response :success
  end

  test "should update bn_nominal_roll" do
    patch bn_nominal_roll_url(@bn_nominal_roll), params: { bn_nominal_roll: {  } }
    assert_redirected_to bn_nominal_roll_url(@bn_nominal_roll)
  end

  test "should destroy bn_nominal_roll" do
    assert_difference("BnNominalRoll.count", -1) do
      delete bn_nominal_roll_url(@bn_nominal_roll)
    end

    assert_redirected_to bn_nominal_rolls_url
  end
end
