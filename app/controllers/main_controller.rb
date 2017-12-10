class MainController < ApplicationController

	def home
		@title = t('.home.title')
	end

	def contact
		@title = t('.contact.title')
	end

	def request_contact
		name = params[:name]
		email = params[:email]
		telephone = params[:telephone]
		message = params[:message]

		ContactMailer.send_email_confirmation(name, email, telephone, message).deliver_now
		redirect_to root_path
	end

end
