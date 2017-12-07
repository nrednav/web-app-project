class ContactMailer < ApplicationMailer

	def send_email_confirmation(name, email, telephone, message)
		@name = name
		@email = email
		@telephone = telephone
		@message = message
		@org = "Kenpachi"

		mail(to: @email, subject: "Message Received")
	end
end
