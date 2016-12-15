require 'test_helper'

class AnimationTest < ActiveSupport::TestCase

  def test_animation
  	assert animations(:one).valid?
  end

  def test_animation_title
  	animations(:one).title = " "
    assert_not animations(:one).valid?
  end

end
