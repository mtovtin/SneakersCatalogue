# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.first_or_create(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
sneakers = []
20.times do
  sneakers << {
    name: Faker::Name.initials,
    description: Faker::Name.last_name ,
    set_image: 'https://picsum.photos/300',
    
  }
end
Sneaker.create!(sneakers)
Sneaker.limit(20).each{|x|x.update(category_names: '1')}