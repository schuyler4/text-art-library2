require 'test_helper'

class StillTest < ActiveSupport::TestCase

  test "a valid still" do
    assert stills(:smile_face).valid?
  end

  test "should not save without a title" do
    stills(:smile_face).title = "  "
    assert_not stills(:smile_face).valid?
  end

  test "title should not be more then 50 characters" do
    stills(:smile_face).title = "a" * 51
    assert_not stills(:smile_face).valid?
  end

  test "should not save without text" do
    stills(:sword).text = " "
    assert_not stills(:sword).valid?
  end

end
