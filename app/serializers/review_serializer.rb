class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :contents, :rating, :restaurant_id, :user_id
  # Pass the attributes which you want to pass in the frontend through fetch request
  belongs_to :restaurant # So you can pass "review.restaurant"
  belongs_to :user # "review.user"
end
