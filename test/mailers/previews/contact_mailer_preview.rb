# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

	def send_email_confirmation
		ContactMailer.send_email_confirmation("Bob", "bob@gmail.com", "+44 07278710", @message = "Test Message")
	end
end
