require "test_helper"

class Public::RecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_records_new_url
    assert_response :success
  end

  test "should get show" do
    get public_records_show_url
    assert_response :success
  end
end
