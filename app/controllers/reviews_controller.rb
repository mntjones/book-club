class ReviewsController < ApplicationController
	def new
		
		@books = Book.all
		@user = User.find_by_id(params[:user_id])
		@review = Review.new
	end

	def create
		
		@review = Review.new(review_params)
		@review.user_id = params[:user_id]
		@review.book_id = params[:book][:title]
		
		# validation to make sure a User can only have one review per book. Redirect to edit_path if an attempt is made to write another one.
		already_reviewed = []
		Review.all.each do |review|
			if review.user.id === @review.user_id && review.book.id == @review.book_id
				already_reviewed << review
			end
		end
		binding.pry
		if !already_reviewed.empty?
			redirect_to edit_user_review_path(already_reviewed[0].user_id, already_reviewed[0].id)
		elsif @review.save
			redirect_to user_path(@review.user)
		else
			redirect_to new_user_review_path
		end

	end

	def show

	end

	def edit
		@books = Book.all
		@review = Review.find_by_id(params[:id])
		@user = User.find_by_id(@review.user_id)
	end

	def update
		@review = Review.find_by(id: params[:id])
		@review.update(review_params)
		redirect_to user_path(@review.user)
	end

	def destroy

	end


	private 

	def review_params
		params.require(:review).permit(:comments, :rating, :user_id, :book_id)
	end

end
