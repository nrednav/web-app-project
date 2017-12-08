class OrderController < ApplicationController

	# This method assists in the creation of an order object
	def create
		@order = Order.new
		@order.total = 0	

		# Remove items where no quantity is selected
		@selected_foods = params[:food].select {|key, value|
			value["quantity"] != ""
		}

		if @selected_foods.keys.empty?
			redirect_to menu_cn_path
		else
			# Calculate total of order
			@selected_foods.each do |key, value|
				@order.total += (value["quantity"].to_i * Food.find(key).price)
			end

			# Add foods to order
			@selected_foods.each do |key, value|
			
				value["quantity"].to_i.times do
					@order.foods << Food.find(key)
				end
			end


			@order.contact_number = ""
			@order.delivery_address = ""

			@order.save

			# If user is logged in, save the order to their list of orders
			if (current_user != nil) 
				current_user.orders << @order
			end

			redirect_to order_path
		end
	end

	def show
		@order = Order.last # Get most recent order

		@unique_foods = @order.foods.uniq # Retrieve a list of all the unique food items

		# Retrace quantities of each item in order
		@quantities = Hash.new(0)

		@order.foods.each do |food|
			@quantities[food] += 1
		end
	end

	def edit
		@order = Order.last
		@cuisine = @order.foods.first.cuisine
		@food = Food.where(cuisine: @cuisine)

		@quantities = Hash.new(0)
		@order.foods.each do |food|
			@quantities[food.name] += 1
		end

		gon.foods = @order.foods
		gon.unique_foods = @order.foods.uniq
		gon.quantities = @quantities

		@order.destroy
	end

	def confirm
	end

end
