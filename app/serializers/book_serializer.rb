class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genre, :pages, :month_assigned, :year_assigned, :avg_rating, :reviews
  attribute :users
  has_many :reviews
  has_many :users, key: 'reviews'

end
