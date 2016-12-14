require 'test_helper'

class UserAuthenticationTest < ActionDispatch::IntegrationTest
  test "can signup a user" do
    get '/signup'
    assert_response :success

    post '/users',
      params: {user: {
        first_name: "oscar",
        last_name: "newton",
        email: "fdasfsadf@gmail.com",
        password: "1234",
      }}

    get '/users/1'
    assert_response :success

  end

  test "will redirect to login if not authenticated" do
    get '/users/1'
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end


end
