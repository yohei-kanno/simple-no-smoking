require "test_helper"

class TwitterSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get twitter_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get twitter_sessions_create_url
    assert_response :success
  end

  test "should get destory" do
    get twitter_sessions_destory_url
    assert_response :success
  end
end
