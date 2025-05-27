# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
user_1 = User.create!(
  name: "Harry",
  phone_number: "0123456789",
  address: "4 Privet Drive, Little Whinging, Surrey",
  email: "harry@gmail.com",
  password: "password123"
)

user_2 = User.create!(
  name: "Hermione",
  phone_number: "0987654321",
  address: "12 Grimmauld Place, London",
  email: "hermione@gmail.com",
  password: "password123"
)

Item.destroy_all
baguette_de_sureau = Item.create!(
    name:    "Baguette de sureau",
    description: "Blablablablablablabla",
    category: "Wand",
    rating: 4.5,
    power: 1000,
    user_id: 1
  )
 baguette_de_scorpion = Item.create!(
    name:    "Baguette de scorpion",
    description: "Blablablablablablabla",
    category: "Wand",
    rating: 4.5,
    power: 1000,
    user_id: 1
  )

  Comment.destroy_all
  Comment.create!(
    content: "C'est une baguette magnifique !",
    author_id: user_1.id,
    target_id: user_2.id
    )








