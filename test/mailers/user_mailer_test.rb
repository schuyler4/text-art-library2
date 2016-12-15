require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def setup
    @user = User.new(first_name: "Bob", last_name: "Billy",
      email: "billyBob@q.com", email_confirmed: true, confirm_token: '1234')

    @still = Still.new(title: "Smile Face", text: ":)")
  end

  def test_still_email
    email = UserMailer.still_email(@user, @still)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['marek.s.newton@gmail.com'], email.from
    assert_equal ['marek.s.newton@gmail.com'], email.to
    assert_equal @still.title, email.subject

  end

  def test_activation_email
    email = UserMailer.welcome_email(@user)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['marek.s.newton@gmail.com'], email.from
    assert_equal ['marek.s.newton@gmail.com'], email.to
    assert_equal 'Confirm Your Account', email.subject
  end
end
