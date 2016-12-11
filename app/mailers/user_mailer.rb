class UserMailer < ApplicationMailer
	default from: 'marek.s.newton@gmail.com'

	def welcome_email(user)
		@user = user
		@url = 'http://localhost:3000/signup'
		mail(to: @user.email, subject: 'Welcome To text art ')
	end
end
