#a book model backed by the "books" data table
#title, author, price, and published date must exist, price must be positive
class Book < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :published_date, presence: true

    has_many :user_books
    has_many :users, through: :user_books
end
