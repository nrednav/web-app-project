require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase

	test "email can be created and details are correct" do 

		name = "Bob"
		to = "Bob@gmail.com"
		telephone = "1234567890"
		from = "support@kenpachi.com"
		message = "Hello"

		email = ContactMailer.send_email_confirmation(name, to, telephone, message)

		assert_equal([from], email.from)
		assert_equal([to], email.to)
		assert_equal("Message Received", email.subject)
	end

	test "deliver_now called on email" do

		name = "Kim"
		to = "Kim@gmail.com"
		telephone = "1234567890"
		message = "hello"
		from = "support@kenpachi.com"

		email = ContactMailer.send_email_confirmation(name, to, telephone, message)
		email_sent = false

		if (email_sent == false)
			email.deliver_now
			email_sent = true
		end

		assert(email_sent)
	end

end
