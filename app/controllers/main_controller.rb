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

		if email.blank?
			flash[:notice] = I18n.t('main.request_contact.no_email')
			redirect_back(fallback_location: root_path)
		else
			ContactMailer.send_email_confirmation(name, email, telephone, message).deliver_now
			flash[:notice] = I18n.t('main.request_contact.email_sent')
			redirect_to root_path
		end
	end

end
