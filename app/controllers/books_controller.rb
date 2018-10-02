class BooksController < ApplicationController
	before_action :require_login
	
	def new
		@book = Book.new
		@grouped_options = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
		
	end

	def create
		@book = Book.new(book_params)
		@grouped_options = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
		
		if @book.save
			render json: @book, status: 201
			#redirect_to book_path(@book)
		else
			render :new
		end

	end

	def show
		@book = Book.find_by_id(params[:id])
		@user = current_user
		@reviews = @book.reviews
		render json: @book, status: 200
	end

	def index
		if logged_in?
			@books = Book.all
			@user = current_user
			render json: @books, status: 200
		else
			redirect_to '/', alert: "please log in"
		end
	end

	def highest_rated
		@book = Book.highest_rated
	end

	private
	def book_params

		params.require(:book).permit(:title, :author, :genre, :pages, :month_assigned, :year_assigned)
	end

end
