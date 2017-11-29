class MainController < ApplicationController

	def home
		@title = t('main.home.title')
	end

	def contact
		@title = t('main.contact.title')
	end

end
