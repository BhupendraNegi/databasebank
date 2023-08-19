require "test_helper"

class ParadeStateOfUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parade_state_of_unit = parade_state_of_units(:one)
  end

  test "should get index" do
    get parade_state_of_units_url
    assert_response :success
  end

  test "should get new" do
    get new_parade_state_of_unit_url
    assert_response :success
  end

  test "should create parade_state_of_unit" do
    assert_difference("ParadeStateOfUnit.count") do
      post parade_state_of_units_url, params: { parade_state_of_unit: {  } }
    end

    assert_redirected_to parade_state_of_unit_url(ParadeStateOfUnit.last)
  end

  test "should show parade_state_of_unit" do
    get parade_state_of_unit_url(@parade_state_of_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_parade_state_of_unit_url(@parade_state_of_unit)
    assert_response :success
  end

  test "should update parade_state_of_unit" do
    patch parade_state_of_unit_url(@parade_state_of_unit), params: { parade_state_of_unit: {  } }
    assert_redirected_to parade_state_of_unit_url(@parade_state_of_unit)
  end

  test "should destroy parade_state_of_unit" do
    assert_difference("ParadeStateOfUnit.count", -1) do
      delete parade_state_of_unit_url(@parade_state_of_unit)
    end

    assert_redirected_to parade_state_of_units_url
  end
end
