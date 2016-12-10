require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "get welcome page" do
    get root_path
    assert_response :success
  end
end
