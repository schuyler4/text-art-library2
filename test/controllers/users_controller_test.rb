require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def test_new
    get new_user_url
    assert_response :success
  end

  def test_create
    assert_difference('User.count') do
      post user_url, params: {user:{
        first_name: "Ethan",
        last_name: "Newbary",
        email: "fdsafdasf@gmail.com",
        password: "123runner",
        id: 1
      }}
    end
    assert_redirected_to article_path(User.last)
  end

end
