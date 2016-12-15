require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "bill", last_name: "panda",
      email: "panda@burrito.com", password_digest: "fsdafsadfadsf",
        confirm_token: "LyPWhuUBkff4bZwV3NZSeQ")
  end

  def test_a_valid_user
    assert @user.valid?
  end

  def test_first_name
    users(:ethan).first_name = "   "
    assert_not users(:ethan).valid?
  end

  def test_first_name_length
    users(:ethan).first_name = "x" * 51
    assert_not users(:ethan).valid?
  end

  def test_last_name
    users(:jannet).last_name = "   "
    assert_not users(:jannet).valid?
  end

  def test_last_name_length
    users(:jannet).last_name = "l" * 51
    assert_not users(:jannet).valid?
  end

  def test_email
    users(:ethan).email = "  "
    assert_not users(:ethan).valid?
  end

  def test_email_length
    users(:ethan).email = "e" * 251 + "@poopmail.com"
    assert_not users(:ethan).valid?
  end

  def test_password
    users(:jannet).password = " "
    assert_not users(:jannet).valid?
  end

end
