class ApplicationController < ActionController::Base

	def welcome
	end
	

  def login(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    redirect_to login_path, alert: "Please login first!" unless logged_in?
  end

  def current_user
    (@current_user ||= User.find(session[:user_id])) if session[:user_id]
  end

end
