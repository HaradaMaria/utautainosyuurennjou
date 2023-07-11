require "test_helper"

class Admin::SongsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_songs_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_songs_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_songs_edit_url
    assert_response :success
  end
end
