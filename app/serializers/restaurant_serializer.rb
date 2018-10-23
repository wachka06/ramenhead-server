class RestaurantSerializer < ActiveModel::Serializer
  attributes :api_id, :id, :name, :image_url, :rating, :price, :display_phone, :display_address, :longitude, :latitude
  has_many :reviews
  has_many :favorites

end
