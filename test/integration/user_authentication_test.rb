require 'test_helper'

class UserAuthenticationTest < ActionDispatch::IntegrationTest
  test "can see the signup page" do
    get '/login'
    assert_response :success
  end
end
