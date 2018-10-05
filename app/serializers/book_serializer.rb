class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genre, :pages, :month_assigned, :year_assigned, :reviews
  has_many :reviews
 
end
