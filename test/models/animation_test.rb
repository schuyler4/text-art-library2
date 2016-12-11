require 'test_helper'

class AnimationTest < ActiveSupport::TestCase

  test "a valid animation" do
  	assert animation(:one).valid?
  end

  test "animation is not valid without title" do

  end

end
