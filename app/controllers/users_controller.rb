class UsersController < ApplicationController

  def new
  	@user = User.new
    @current_user = current_user
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		redirect_to root_path, :notice => "You are now registered!"
  	else
  		render :new
  	end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
