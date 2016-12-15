require 'test_helper'

class StillTest < ActiveSupport::TestCase

  def test_still
    assert stills(:smile_face).valid?
  end

  def test_still_title
    stills(:smile_face).title = "  "
    assert_not stills(:smile_face).valid?
  end

  def test_still_title_length 
    stills(:smile_face).title = "a" * 51
    assert_not stills(:smile_face).valid?
  end

  def test_still_text_length
    stills(:sword).text = " "
    assert_not stills(:sword).valid?
  end

end
