# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

natsuki = User.create(name: "natsuki", password: "kytc", email:"grweio")
nicky = User.create(name: "nicky" ,password: "fuy", email:"ger")

ippudo = Restaurant.create(name: "Ippudo",
  image_url: "https://s3-media2.fl.yelpcdn.com/ephoto/TZ0gQ1nSBVe_X4PYg44s0w/o.jpg",
  rating: 5, price:"$$", display_phone:"12345678910",
  display_address:"WeWork", latitude: "37.8114102",
  longitude: "-122.2665892",
  api_id: "apikey"
)

ramenJoint = Restaurant.create(name: "Ramen Joint",
  image_url: "https://s3-media2.fl.yelpcdn.com/ephoto/TZ0gQ1nSBVe_X4PYg44s0w/o.jpg",
  rating: 5, price:"$$", display_phone:"12345678910",
  display_address:"WeWork", latitude: "37.8114102",
  longitude: "-122.2665892",
  api_id: "apikey"
)

review = Review.create(contents: "its ok", rating: 2.0, user_id: 1, restaurant_id: 1)
review = Review.create(contents: "its ok", rating: 2.0, user_id: 1, restaurant_id: 1)
review = Review.create(contents: "its ok", rating: 2.0, user_id: 1, restaurant_id: 1)
review = Review.create(contents: "its ok", rating: 2.0, user_id: 1, restaurant_id: 1)
