class BooksController < ApplicationController

	def new
		@grouped_options = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)

		if @book.save
			redirect_to book_path(@book)
		else
			redirect_to new_book_path, alert: "Information entered incorrectly, please try again."
		end

	end

	def show
		@book = Book.find_by_id(params[:id])

	end

	def index
		@books = Book.all

	end

	private
	def book_params

		params.require(:book).permit(:title, :author, :genre, :pages, :month_assigned, :year_assigned)
	end

end
