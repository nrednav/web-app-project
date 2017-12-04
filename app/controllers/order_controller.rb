class OrderController < ApplicationController

	# This method assists in the creation of an order object
	def create
		@order = Order.new

		redirect_to order_path
	end

	def show
		@orders = Order.all
	end

end
