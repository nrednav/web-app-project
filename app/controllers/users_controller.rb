class UsersController < ApplicationController

  def new
    @title = t('main.navigation.register')
  	@user = User.new
    @current_user = current_user
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
      RegistrationMailer.send_email_confirmation(@user.email).deliver_now
  		redirect_to root_path, :notice => "Registration Successfull!"
  	else
  		render :new
  	end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
