class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comments, :rating
  belongs_to :book
end
