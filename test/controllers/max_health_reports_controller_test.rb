require "test_helper"

class MaxHealthReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @max_health_report = max_health_reports(:one)
  end

  test "should get index" do
    get max_health_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_max_health_report_url
    assert_response :success
  end

  test "should create max_health_report" do
    assert_difference("MaxHealthReport.count") do
      post max_health_reports_url, params: { max_health_report: {  } }
    end

    assert_redirected_to max_health_report_url(MaxHealthReport.last)
  end

  test "should show max_health_report" do
    get max_health_report_url(@max_health_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_max_health_report_url(@max_health_report)
    assert_response :success
  end

  test "should update max_health_report" do
    patch max_health_report_url(@max_health_report), params: { max_health_report: {  } }
    assert_redirected_to max_health_report_url(@max_health_report)
  end

  test "should destroy max_health_report" do
    assert_difference("MaxHealthReport.count", -1) do
      delete max_health_report_url(@max_health_report)
    end

    assert_redirected_to max_health_reports_url
  end
end
