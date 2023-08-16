require "test_helper"

class LeaveStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leave_state = leave_states(:one)
  end

  test "should get index" do
    get leave_states_url
    assert_response :success
  end

  test "should get new" do
    get new_leave_state_url
    assert_response :success
  end

  test "should create leave_state" do
    assert_difference("LeaveState.count") do
      post leave_states_url, params: { leave_state: {  } }
    end

    assert_redirected_to leave_state_url(LeaveState.last)
  end

  test "should show leave_state" do
    get leave_state_url(@leave_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_leave_state_url(@leave_state)
    assert_response :success
  end

  test "should update leave_state" do
    patch leave_state_url(@leave_state), params: { leave_state: {  } }
    assert_redirected_to leave_state_url(@leave_state)
  end

  test "should destroy leave_state" do
    assert_difference("LeaveState.count", -1) do
      delete leave_state_url(@leave_state)
    end

    assert_redirected_to leave_states_url
  end
end
