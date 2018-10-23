class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password_digest
  has_many :reviews
  has_many :review_restaurants
end
