class RegistrationMailer < ApplicationMailer

	# Method to be called when user registers
	def send_email_confirmation(email)
		@email = email
		@url = login_url

		mail(to: @email, subject: "Confirmation of Registration")
	end
end
