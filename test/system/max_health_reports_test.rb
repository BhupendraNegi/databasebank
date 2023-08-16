require "application_system_test_case"

class MaxHealthReportsTest < ApplicationSystemTestCase
  setup do
    @max_health_report = max_health_reports(:one)
  end

  test "visiting the index" do
    visit max_health_reports_url
    assert_selector "h1", text: "Max health reports"
  end

  test "should create max health report" do
    visit max_health_reports_url
    click_on "New max health report"

    click_on "Create Max health report"

    assert_text "Max health report was successfully created"
    click_on "Back"
  end

  test "should update Max health report" do
    visit max_health_report_url(@max_health_report)
    click_on "Edit this max health report", match: :first

    click_on "Update Max health report"

    assert_text "Max health report was successfully updated"
    click_on "Back"
  end

  test "should destroy Max health report" do
    visit max_health_report_url(@max_health_report)
    click_on "Destroy this max health report", match: :first

    assert_text "Max health report was successfully destroyed"
  end
end
