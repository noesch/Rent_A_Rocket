# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing database..."

Rocket.destroy_all
User.destroy_all

user = User.create(email: "test@test.com", password: "123123")

puts "Building database..."

rocket_one = { name: "Falcon 9", price: 10000, fuel: "Kerosin", description: "really cool spaceship", user: user }
rocket_two = { name: "Blue Origin", price: 20000, fuel: "H2O", description: "Amazong rocket", user: user }
rocket_three = { name: "Challenger", price: 5, fuel: "Diesel", description: "For the daring", user: user }
rocket_four = { name: "Saturn 5", price: 8000, fuel: "Corn starch", description: "Not fancy but it'll do", user: user }
rocket_five = { name: "UFO", price: 500000000, fuel: "Micro Black Holes", description: "Welcome to the future", user: user }

[rocket_one, rocket_two, rocket_three, rocket_four, rocket_five].each do |rocket|
  Rocket.create(rocket)
end

puts "Finished"
