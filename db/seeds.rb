# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Restaurant.destroy_all
Comment.destroy_all
User.destroy_all

puts "Creating database..."

5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
  10.times do
    restaurant = Restaurant.new(name: Faker::Restaurant.name,
    address: Faker::Address.city,
    user: user)
    restaurant.save!
    4.times do
      comment = Comment.new(
        content: Faker::Restaurant.review,
        restaurant: restaurant,
        user: (User.all).sample
      )
      comment.save!
    end
  end
end

puts "Finished !"
