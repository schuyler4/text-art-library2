require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test "a valid comment" do
    assert comments(:one).valid?
  end

  test "comment is not valid without body" do
    comments(:one).body = " "
    assert_not comments(:one).valid?
  end

end
