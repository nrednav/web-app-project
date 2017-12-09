require 'test_helper'

class RegistrationMailerTest < ActionMailer::TestCase

	test "email can be created and details are correct" do 

		@to = "Bob@gmail.com"
		@from = "support@kenpachi.com"

		email = RegistrationMailer.send_email_confirmation(@to)

		assert_equal([@from], email.from)
		assert_equal([@to], email.to)
		assert_equal("Confirmation of Registration", email.subject)
	end

	test "deliver_now called on email" do

		to = "Kim@gmail.com"
		from = "support@kenpachi.com"

		email = RegistrationMailer.send_email_confirmation(to)
		email_sent = false

		if (email_sent == false)
			email.deliver_now
			email_sent = true
		end

		assert(email_sent)
	end
end
