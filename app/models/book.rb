class Book < ApplicationRecord
	has_many :reviews
	has_many :users, through: :reviews
	validates :title, :author, :month_assigned, presence: true
	validates :year_assigned, presence: true, inclusion: { in: 1900..Date.today.year },
					  format: { 
					    with: /(19|20)\d{2}/i, 
					    message: "should be a four-digit year less than or equal to this year"
					  }
	
	def avg_rating
		rating = 0.0 # sets a float
		count = self.reviews.count # counts the number of reviews for a particular book
		self.reviews.each do |review|
			rating += review.rating
		end
		if count == 0
			"This book has not been rated yet."
		else
			(rating/count).round(1) # rounds rating to one decimal
		end
		
	end

end
