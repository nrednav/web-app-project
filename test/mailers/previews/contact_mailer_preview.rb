# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

	def send_email_confirmation
		ContactMailer.send_email_confirmation("Bob", "bob@bob.com", "12345688", @message = "Hello")
	end
end
