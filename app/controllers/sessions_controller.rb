class SessionsController < ApplicationController
	skip_before_action :require_login, only: [:new, :create]
	
	def new
    redirect_to books_path if logged_in?
  end

  def create

    redirect_to books_path if logged_in?
    # if request.env['omniauth.auth']
    #   user = User.from_omniauth(auth)
    #   login(user)
    #   redirect_to scales_path
    # else
      user = User.find_by_email(params[:email])
      if !user
      	redirect_to new_user_path, alert: "Email Not found."
      elsif !user.authenticate(params[:password])
      	redirect_to login_path, alert: "Password doesn't match."
      else
      	login(user)
      	redirect_to user_path(user)
      end
    # end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
