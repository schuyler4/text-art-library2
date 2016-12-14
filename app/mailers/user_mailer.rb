class UserMailer < ApplicationMailer
	default from: 'marek.s.newton@gmail.com'

	def welcome_email(user)
		@user = user
		mail(:to => @user.email,
		:subject => "Thanks For Signing up")
	end
end
