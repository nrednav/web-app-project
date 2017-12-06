class SessionsController < ApplicationController

  def new
  end

  def create
  	user = login(params[:email], params[:password])

  	if user
  		redirect_to root_path, :notice => "You have successfully logged in!"
  	else
  		flash.now.alert = "Email or Password was incorrect"
  		render :new
  	end
  end

  def destroy
  	logout
  	redirect_to root_path
  end

end
