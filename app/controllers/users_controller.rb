class UsersController < ApplicationController
	before_action :logged_in?, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    	session[:user_id] = @user.id
    	redirect_to user_path(@user)
    else

    	redirect_to new_user_path, alert: "Please enter data in all fields."
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user == current_user
      @books = @user.books
      @reviews = @user.reviews
    else
      destroy
    end

  end

  def destroy
    session.delete(:user_id)
  	redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end
