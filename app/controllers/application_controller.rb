class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Get currently logged in user so it can be referenced in navigation partial
  def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end	

end
