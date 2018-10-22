class User < ApplicationRecord
  has_many :reviews
  has_many :review_restaurants, through: :reviews, source: :restaurant
  has_many :favorites
  has_many :favorite_restaurants, through: :favorites, source: :restaurant
  # If there're two "has_many :restaurants", the first one will be rewritten by the second one.
  # to avoid this, you need to differentiate by writing ":review_restaurants" and ":favorite_restaurants",
  # and to make Acctiverecord recognize "favorite_restaurants" = "restaurant", we need to add "source: :restaurant."
  has_secure_password
end
