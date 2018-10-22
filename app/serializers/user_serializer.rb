class UserSerializer < ActiveModel::Serializer
  attributes :id
  has_many :reviews
  has_many :review_restaurants
end
