require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get nwe" do
    get new_user_url
    assert_response :success
  end

  test "should create a user" do
    assert_difference('User.count') do
      post user_url, params: {user:{
        first_name: "Ethan",
        last_name: "Newbary",
        email: "fdsafdasf@gmail.com",
        password: "123runner",
      }}
    end

    assert_redirected_to user_path(w)
  end

end
