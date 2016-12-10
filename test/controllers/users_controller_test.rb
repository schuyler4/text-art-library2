require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get the signup page" do
    get signup_path
    assert_response :success
  end

  test "should sign up a user" do
    user = users(:ethan)

    post user_path, params: {user: {
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email,
      password_digest: user.password_digest
    }}

    assert_equal user.id, session[:user_id]
  end

  test "should logout a user" do
    get '/logout  '
    assert_response :success
  end

end
