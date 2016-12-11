class UserMailer < ActionMailer::Base
	default :from => "marek.s.newton@gmail.com"

	def registration_confirmation(user)
		@user = user
		mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
	end

	
end