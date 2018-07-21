class Book < ApplicationRecord
	has_many :reviews
	has_many :users, through: :reviews

	
	def avg_rating
		rating = 0
		count = self.reviews.count
		self.reviews.each do |review|
			rating += review.rating
		end
		if count == 0
			"This book has not been rated yet."
		else
			rating/count
		end
		
	end

end
