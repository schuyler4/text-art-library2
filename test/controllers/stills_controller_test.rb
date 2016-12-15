require 'test_helper'

class StillsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(first_name: "Bob", last_name: "Billy",
      email: "billyBob@q.com", email_confirmed: true, confirm_token: '1234',
      id: 1)
  end

  def test_new
    session[:user_id] = @user.id
    get new_user_still_path(@user)
    assert_response :success
  end
end
