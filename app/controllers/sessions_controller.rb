class SessionsController < ApplicationController
	
	def new
    redirect_to books_path if logged_in?
  end

  def create

    if auth_env #facebook login

      @user = User.find_or_create_by(email: auth_env["info"]["email"])
      @user.name = auth_env["info"]["email"]
      @user.id = User.all.last.id + 1
      @user.save
      binding.pry
      redirect_to user_path(@user)
    else #regular login
      user = User.find_by_email(params[:email])
      if !user
      	redirect_to new_user_path, alert: "email not found in database"
      elsif !user.authenticate(params[:password])
      	redirect_to login_path, alert: "password does not match"
      else
      	login(user)
      	redirect_to user_path(user)
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  private

  def auth_env
    request.env['omniauth.auth']
  end

end
