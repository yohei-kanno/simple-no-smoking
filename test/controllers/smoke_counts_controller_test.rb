require "test_helper"

class SmokeCountsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get smoke_counts_edit_url
    assert_response :success
  end
end
