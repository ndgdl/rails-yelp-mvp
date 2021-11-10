# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
puts "Cleaning done!"

Restaurant.destroy_all
Review.destroy_all

puts "Seeding..."

restaurant_categories = %w[chinese italian japanese french belgian]

10.times do
  new_restaurant = Restaurant.new(
                    name: Faker::Restaurant.name,
                    address: Faker::Address.full_address,
                    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
                    category: restaurant_categories.sample
                  )

  new_restaurant.save

  rand(1..10).times do
    new_review = Review.new(
                  content: Faker::Restaurant.review,
                  rating: rand(0..5),
                  restaurant_id: new_restaurant.id
                )
    new_review.save
  end
end
puts 'Seeding done!'
puts "#{Restaurant.count} restaurants created"
puts "#{Review.count} reviews created"
