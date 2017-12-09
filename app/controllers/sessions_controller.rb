class SessionsController < ApplicationController

  def new
    @title = t('main.navigation.login')
  end

  def create
  	user = login(params[:email], params[:password])

  	if user
  		redirect_to root_path, :notice => "You have successfully logged in!"
  	else
  		flash.now.alert = "The E-mail or Password you entered was incorrect."
  		render :new
  	end
  end

  def destroy
  	logout
  	redirect_to root_path
  end

  def view_order
    @order = Order.find(params[:id])

    # Retrieve a list of all the unique food items
    @unique_foods = @order.foods.uniq 

    # Retrace quantities of each item in order
    @quantities = Hash.new(0)

    @order.foods.each do |food|
      @quantities[food] += 1
    end
  end

  def list_orders
    @orders = current_user.orders
  end

end
