require "test_helper"

class ReductonUserProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reducton_user_profiles_new_url
    assert_response :success
  end

  test "should get edit" do
    get reducton_user_profiles_edit_url
    assert_response :success
  end
end
