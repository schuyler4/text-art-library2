require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def test_comment
    assert comments(:one).valid?
  end

  def test_comment_body 
    comments(:one).body = " "
    assert_not comments(:one).valid?
  end

end
