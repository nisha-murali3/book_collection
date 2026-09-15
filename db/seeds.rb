# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Book.create!(title: "The Hobbit", author: "J.R.R. Tolkien", price: 12.99, published_date: Date.new(1937, 9, 21))
Book.create!(title: "1984", author: "George Orwell", price: 10.99, published_date: Date.new(1949, 6, 8))
Book.create!(title: "Dune", author: "Frank Herbert", price: 15.99, published_date: Date.new(1965, 8, 1))
Book.create!(title: "Brave New World", author: "Aldous Huxley", price: 9.99, published_date: Date.new(1932, 1, 1))
Book.create!(title: "Fahrenheit 451", author: "Ray Bradbury", price: 11.49, published_date: Date.new(1953, 10, 19))