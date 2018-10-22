class RestaurantSerializer < ActiveModel::Serializer
  attributes :api_id, :id
  has_many :reviews
  has_many :favorites

end
