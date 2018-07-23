class User < ApplicationRecord
	has_many :reviews
	has_many :books, through: :reviews
	has_secure_password

	validates :email, uniqueness: true
	validates :name, :email, presence: true

end
