class User < ApplicationRecord
	has_many :reviews
	has_many :books, through: :reviews
	has_secure_password

	validates :email, uniqueness: true
	validates :name, :email, presence: true

	def self.from_omniauth(auth)
    self.where(email: auth['info']['email']).first_or_create do |user|
    user.password = SecureRandom.hex #sets a random password for required password field
    user.name = auth['info']['name']
    end
  end
end
