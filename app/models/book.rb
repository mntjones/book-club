class Book < ApplicationRecord
	has_many :reviews
	has_many :users, through: :reviews
	validates :title, :author, :month_assigned, presence: true
	validates :year_assigned, presence: true, inclusion: { in: 1900..Date.today.year },
					  format: { 
					    with: /(19|20)\d{2}/i, 
					    message: "should be a four-digit year less than or equal to this year"
					  }
	
	scope :most_reviews, -> { Book.left_joins(:reviews).group(:book_id).order('COUNT(reviews.id) DESC').limit(1) }

	def review_count
		self.reviews.count # counts the number of reviews for a particular book
	end

	def avg_rating
		rating = 0.0 # sets a float
		self.reviews.each do |review|
			rating += review.rating
		end
		if self.review_count == 0
			"This book has not been rated yet."
		else
			(rating/self.review_count).round(1) # rounds rating to one decimal
		end
		
	end

	def self.highest_rated

		high_review = 0.0
		hold = self.new

		self.all.each do |book|
			if book.avg_rating > high_review
				hold = book
			end
		end
		hold
	end

end

## /highest_rated