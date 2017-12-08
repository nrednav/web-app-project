# Preview all emails at http://localhost:3000/rails/mailers/registration_mailer
class RegistrationMailerPreview < ActionMailer::Preview
	def send_email_confirmation
		RegistrationMailer.send_email_confirmation("bob@gmail.com")
	end
end
