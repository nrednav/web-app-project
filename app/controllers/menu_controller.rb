class MenuController < ApplicationController

	def menu
		@title = t('main.navigation.menu')
	end

	def show
		@cuisine = params[:cuisine]

		case @cuisine
		when 'cn'
			@food = Food.where(:cuisine => 'cn')
			render 'menu/cuisine/cn'
		when 'jp'
			@food = Food.where(:cuisine => 'jp')
			render 'menu/cuisine/jp'
		when 'kr'
			@food = Food.where(:cuisine => 'kr')
			render 'menu/cuisine/kr'
		end
	end
	
end
