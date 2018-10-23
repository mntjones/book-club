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
			@review = Review.new
			@reviews = @book.reviews
			render '/books/show'
			#redirect_to book_path(@book)
		else
			render :new
		end

	end

	def show
		@book = Book.find_by_id(params[:id])
		@user = current_user
		@reviews = @book.reviews
		@review = Review.new
		respond_to do |format|
      format.html { render :show }
      format.json { render json: @book }
    end
	end

	def index
		if logged_in?
			@books = Book.all
			@user = current_user
			respond_to do |format|
	      format.html { render :index }
	      format.json { render json: @books}
	    end
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
