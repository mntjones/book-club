class ReviewsController < ApplicationController
	before_action :require_login
	
	def new

		@book = Book.find_by_id(params[:book_id])
		@user = current_user
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		@review.book_id = params[:book_id]
		@book = Book.find_by_id(@review.book_id)
		
		# validation to make sure a User can only have one review per book. Redirect to edit_path if an attempt is made to write another one.
		already_reviewed = []
		Review.all.each do |review|
			if review.user.id === @review.user_id && review.book.id == @review.book_id
				already_reviewed << review
			end
		end

		if !already_reviewed.empty?
			redirect_to edit_user_review_path(already_reviewed[0].user_id, already_reviewed[0].id)
		elsif @review.save
			# render json: @review
			render 'reviews/show', :layout => false
		else
			render :new
		end

	end

	def show

	end

	def edit
		@review = Review.find_by_id(params[:id])
		@book = Book.find_by_id(@review.book_id)
		@user = User.find_by_id(@review.user_id)
	end

	def update

		@review = Review.find_by(id: params[:id])
		@book = Book.find_by_id(@review.book_id)
		@user = User.find_by_id(@review.user_id)
		if @review.update(review_params)
			redirect_to user_path(@user)
		else
			render :edit
		end
	end

	def destroy
		@review = Review.find_by_id(params[:id])
		@user = User.find_by_id(@review.user_id)
		@review.delete
		redirect_to user_path(@user)
	end


	private 

	def review_params
		params.require(:review).permit(:comments, :rating, :user_id, :book_id)
	end

end
