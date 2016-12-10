require 'test_helper'

class UserTest < ActiveSupport::TestCase

#  test "a valid user" do
  #  assert users(:jannet).valid?
  #end

  #test "first name should be present" do
  #  users(:ethan).first_name = "   "
  #  assert_not users(:ethan).valid?
  #end

  #test "first name should not be to long" do
  #  users(:ethan).first_name = "x" * 51
  #  assert_not users(:ethan).valid?
  #end

  #test "last name should be present" do
  #  users(:jannet).last_name = "   "
  #  assert_not users(:jannet).valid?
  #end

  #test "last name should not be to long" do
  #  users(:jannet).last_name = "l" * 51
  #  assert_not users(:jannet).valid?
  #end

  #test "email should be present" do
    #users(:ethan).email = "  "
  #  assert_not users(:ethan).valid?
#  end

  #test "email should not be to long" do
  #  users(:ethan).email = "e" * 251 + "@poopmail.com"
  #  assert_not users(:ethan).valid?
  #end

  #test "email validation should accept valid address" do
  #  valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
  #    first.last@foo.jp alice+bob@baz.cn]

  #  valid_addresses.each do |address|
  #    users(:ethan).email = address
  #    assert users(:ethan).valid?
  #  end
  #end

  #test "email shoud reject invalid address" do
  #  invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
  #    foo@bar_baz.com foo@bar+baz.com]

  #  invalid_addresses.each do |bad_address|
  #    users(:ethan).email = bad_address
  #    assert_not users(:ethan).email
  #  end
  #end

  #test "password should be present" do
  #  users(:jannet).password_ = " "
  #end

end
