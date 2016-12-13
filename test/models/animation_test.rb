require 'test_helper'

class AnimationTest < ActiveSupport::TestCase

  test "a valid animation" do
  	assert animations(:one).valid?
  end

  test "animation is not valid without title" do
  	animations(:one).title = " "
    assert_not animations(:one).valid?
  end

end
