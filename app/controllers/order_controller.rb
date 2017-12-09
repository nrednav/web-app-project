class OrderController < ApplicationController

	# Create the order and add all selected foods to it
	def create
		@order = Order.new
		@order.total = 0	

		# Remove items where no quantity is selected
		@selected_foods = params[:food].select {|key, value| value["quantity"] != ""}

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

	# Display a summary of the order
	def show
		@order = Order.last # Get most recent order

		@unique_foods = @order.foods.uniq # Retrieve a list of all the unique food items

		# Retrace quantities of each item in order
		@quantities = Hash.new(0)

		@order.foods.each do |food|
			@quantities[food] += 1
		end
	end

	# Handle updating the order with changes made
	def edit
		@order = Order.last
		@cuisine = @order.foods.first.cuisine
		@food = Food.cuisine(@cuisine)

		@quantities = Hash.new(0)
		@order.foods.each do |food|
			@quantities[food.name] += 1
		end

		gon.foods = @order.foods
		gon.unique_foods = @order.foods.uniq
		gon.quantities = @quantities

		@order.destroy
	end

	# Handle displaying order confirmation
	def confirm_order

		case request.method
		when 'POST'
			if (!current_user)
				# Get and store the params in the last order available
				@order = Order.last
				@order.delivery_address = params[:order][:delivery_address]
				@order.contact_number = params[:order][:contact_number]
				@order.save
			else
				# Get the users last order ( which is the present one )
				@order = current_user.orders.last
				@order.delivery_address = params[:order][:delivery_address]
				@order.contact_number = params[:order][:contact_number]
				@order.save
			end

		when 'GET'
			if (!current_user)
				@order = Order.last
				@user_flag = "new"
			else
				@order = current_user.orders.last
				@user_flag = "existing"
			end
		end
	end
end
