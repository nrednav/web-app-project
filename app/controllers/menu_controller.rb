class MenuController < ApplicationController

	def menu
		@title = t('main.navigation.menu')
	end

	def show
		@cuisine = params[:cuisine]

		case @cuisine
		when 'cn'
			render 'menu/cuisine/cn'
		when 'jp'
			render 'menu/cuisine/jp'
		when 'kr'
			render 'menu/cuisine/kr'
		end
	end
	
end
