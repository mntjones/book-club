class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :reviews
  has_many :reviews
end