require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "a valid user" do
    assert users(:jannet).valid?
  end

  test "first name should be present" do
    users(:ethan).first_name = "   "
    assert_not users(:ethan).valid?
  end

  test "first name should not be to long" do
    users(:ethan).first_name = "x" * 51
    assert_not users(:ethan).valid?
  end

  test "last name should be present" do
    users(:jannet).last_name = "   "
    assert_not users(:jannet).valid?
  end

  test "last name should not be to long" do
    users(:jannet).last_name = "l" * 51
    assert_not users(:jannet).valid?
  end

  test "email should be present" do
    users(:ethan).email = "  "
    assert_not users(:ethan).valid?
  end

  test "email should not be to long" do
    users(:ethan).email = "e" * 251 + "@poopmail.com"
    assert_not users(:ethan).valid?
  end

  test "password should be present" do
    users(:jannet).password = " "
    assert_not users(:jannet).valid?
  end

end
