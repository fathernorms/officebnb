# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

5.times do
  user = User.create!(email: Faker::Internet.email, password: rand(100_000..999_999))
  2.times do
    user.listings.create!(
      name: Faker::Mountain.name,
      address: Faker::Address.street_address,
      description: Faker::Lorem.paragraph,
      capacity: rand(1..10),
      rate_per_day: rand(100..300)
    )
  end
end
