class UsersController < ApplicationController
	before_action :logged_in?, only: [:show]

  def new
    if logged_in?
      redirect_to user_path(current_user)
      flash[:notice] = "You are already logged in."
    else
      @user = User.new
      
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @message = nil
    	session[:user_id] = @user.id
    	redirect_to user_path(@user)
    else
    	render :new
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
