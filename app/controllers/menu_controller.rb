class MenuController < ApplicationController

	def menu
		@title = t('main.navigation.menu')
	end

	def show
		@cuisine = params[:cuisine]

		# Load the appropriate menu based on which cuisine was requested
		case @cuisine
		when 'cn'
			@food = Food.cuisine("cn")	
			render 'menu/cuisine/cn'
		when 'jp'	
			@food = Food.cuisine("jp")
			render 'menu/cuisine/jp'
		when 'kr'
			@food = Food.cuisine("kr")
			render 'menu/cuisine/kr'
		end
	end

end
