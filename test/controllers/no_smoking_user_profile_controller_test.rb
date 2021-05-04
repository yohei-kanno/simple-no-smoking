require "test_helper"

class NoSmokingUserProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get no_smoking_user_profile_new_url
    assert_response :success
  end
end
