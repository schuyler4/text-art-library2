class UserMailer < ApplicationMailer
	default from: 'marek.s.newton@gmail.com'

	def welcome_email(user)
		@user = user
		mail(:to => "marek.s.newton@gmail.com", :subject => "Confirm Your Account")
	end

	def still_email(user, still)
		@user = user
		@still = still

		mail(:to => "marek.s.newton@gmail.com", :subject => @still.title)
	end
end
