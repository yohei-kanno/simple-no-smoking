require "test_helper"

class ModesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get modes_new_url
    assert_response :success
  end

  test "should get edit" do
    get modes_edit_url
    assert_response :success
  end
end
