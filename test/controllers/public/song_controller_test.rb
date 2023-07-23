require "test_helper"

class Public::SongControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_song_new_url
    assert_response :success
  end

  test "should get index" do
    get public_song_index_url
    assert_response :success
  end

  test "should get show" do
    get public_song_show_url
    assert_response :success
  end
end
