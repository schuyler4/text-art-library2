require 'test_helper'

class SlideTest < ActiveSupport::TestCase
  def test_slide
    assert slides(:smile_face_slide).valid?
  end
end
