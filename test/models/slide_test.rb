require 'test_helper'

class SlideTest < ActiveSupport::TestCase

  test "a valid slide" do
    assert slides(:smile_face_slide).valid?
  end

end
