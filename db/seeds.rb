require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
ishoBoii = User.create(name: "RamenBoii", password_digest: "IshoBoiiii", email:"IshoBoii@gmail.com")
ishoGirl = User.create(name: "RamenGirl", password_digest: "IshoGirlll", email:"IshoGirl@gmail.com")
User.create(name: Faker::Name.unique.name, password_digest: Faker::Internet.unique.password, email: Faker::Internet.unique.email)
User.create(name: Faker::Name.unique.name, password_digest: Faker::Internet.unique.password, email: Faker::Internet.unique.email)
User.create(name: Faker::Name.unique.name, password_digest: Faker::Internet.unique.password, email: Faker::Internet.unique.email)

Restaurant.destroy_all
ippudo = Restaurant.create(name: "Ippudo NY",
  image_url: "https://s3-media2.fl.yelpcdn.com/ephoto/TZ0gQ1nSBVe_X4PYg44s0w/o.jpg",
  rating: 5, price:"$$", display_phone:"(212) 974-2500",
  display_address:"65 4th Ave, New York, NY 10003", latitude: "37.8114102",
  longitude: "-122.2665892",
  api_id: "apikey"
)

ichiran = Restaurant.create(name: "ICHIRAN Midtown",
  image_url: "https://s3-media2.fl.yelpcdn.com/ephoto/TZ0gQ1nSBVe_X4PYg44s0w/o.jpg",
  rating: 5, price:"$$", display_phone:"(212) 465-0701",
  display_address:"132 W 31st St, New York, NY 10001", latitude: "37.8114102",
  longitude: "-122.2665892",
  api_id: "apikey"
)

Review.destroy_all

review = Review.create(contents: "Food was good, but really disappointing service. ", rating: 3.0, user_id: ishoBoii.id, restaurant_id: ippudo.id)
review = Review.create(contents: "It's definitely a fun, festive, and memorable meal!  Highly recommend.", rating: 2.0, user_id: ishoGirl.id, restaurant_id: ichiran.id)
review = Review.create(contents: "The table next to us are ordered pork belly and gyoza, LOOKS and SMELLS amazing. I would definitely go for those next time!", rating: 2.0, user_id: ishoBoii.id, restaurant_id: ippudo.id)
review = Review.create(contents: "The service is subpar. The waitress only filled our water once and never came to check in with us.", rating: 4.0, user_id: ishoGirl.id, restaurant_id: ichiran.id)

favorite = Favorite.create(user_id: ishoBoii.id, restaurant_id: ippudo.id)
favorite = Favorite.create(user_id: ishoGirl.id, restaurant_id: ichiran.id)
