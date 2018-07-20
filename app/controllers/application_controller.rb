class ApplicationController < ActionController::Base

	def logged_in?
	    redirect_to '/' unless current_user
	end

	def current_user
	  User.find_by(id: session[:user_id])
	end


end
