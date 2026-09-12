require "rails_helper"

RSpec.describe Book, type: :model do
  # Book sunny day -- valid with a title 
  it "is valid with a title" do
    book = Book.new(title: "The Hobbit", author: "J.R.R. Tolkien", price: 12.99, published_date: Date.today)
    expect(book).to be_valid
  end

  # Book rainy day - title invalid, everything else fine 
  it "is invalid without a title (rainy day)" do
    book = Book.new(title: nil, author: "J.R.R. Tolkien", price: 12.99, published_date: Date.today)
    expect(book).not_to be_valid
  end

    #Author sunny day -- valid with an author
  it "is valid with an author" do
    book = Book.new(title: "1984", author: "George Orwell", price: 10.99, published_date: Date.today)
    expect(book).to be_valid
  end

  # Author rainy day -- invalid without an author, everything else fine
  it "is invalid without an author (rainy day)" do
    book = Book.new(title: "1984", author: nil, price: 10.99, published_date: Date.today)
    expect(book).not_to be_valid
  end

    #Price sunny day -- valid with a price
  it "is valid with a price" do
    book = Book.new(title: "Dune", author: "Frank Herbert", price: 15.99, published_date: Date.today)
    expect(book).to be_valid
  end

  # Price rainy day -- invalid without a price, everything else fine
  it "is invalid without a price (rainy day)" do
    book = Book.new(title: "Dune", author: "Frank Herbert", price: nil, published_date: Date.today)
    expect(book).not_to be_valid
  end

  # Published date sunny day -- valid with a published date
  it "is valid with a published date" do
    book = Book.new(title: "Brave New World", author: "Aldous Huxley", price: 9.99, published_date: Date.today)
    expect(book).to be_valid
  end

  # Published date rainy day -- invalid without a published date, everything else fine
  it "is invalid without a published date (rainy day)" do
    book = Book.new(title: "Brave New World", author: "Aldous Huxley", price: 9.99, published_date: nil)
    expect(book).not_to be_valid
  end
end

RSpec.describe "Books", type: :request do
  #Ttitle integration sunny day -- flash message appears when book is created with a valid title
  it "creates a book with a valid title" do
    post books_path, params: { book: { title: "The Hobbit", author: "J.R.R. Tolkien", price: 12.99, published_date: Date.today } }
    follow_redirect!
    expect(response.body).to include("Book was successfully created.")
  end

  # title integration rainy day -- flash message does not appear when book is created with a blank title
  it "does not create a book with a blank title (rainy day)" do
    post books_path, params: { book: { title: "", author: "J.R.R. Tolkien", price: 12.99, published_date: Date.today } }
    expect(response.body).not_to include("Book was successfully created.")
  end

  # author integration sunny day -- flash message appears when book is created with a valid author
  it "creates a book with a valid author" do
    post books_path, params: { book: { title: "1984", author: "George Orwell", price: 10.99, published_date: Date.today } }
    follow_redirect!
    expect(response.body).to include("Book was successfully created.")
    expect(Book.last.author).to eq("George Orwell")
  end

  # author integration rainy day -- flash message does not appear when book is created with a blank author
  it "does not create a book with a blank author (rainy day)" do
    post books_path, params: { book: { title: "1984", author: "", price: 10.99, published_date: Date.today } }
    expect(response.body).not_to include("Book was successfully created.")
  end

  #price integration sunny day -- flash message appears when book is created with a valid price
  it "creates a book with a valid price" do
    post books_path, params: { book: { title: "Dune", author: "Frank Herbert", price: 15.99, published_date: Date.today } }
    follow_redirect!
    expect(response.body).to include("Book was successfully created.")
    expect(Book.last.price).to eq(15.99)
  end

  # Price integration rainy day -- flash message does not appear when book is created with a blank price
  it "does not create a book with a blank price (rainy day)" do
    post books_path, params: { book: { title: "Dune", author: "Frank Herbert", price: "", published_date: Date.today } }
    expect(response.body).not_to include("Book was successfully created.")
  end

  # published date integration sunny day -- flash message appears when book is created with a valid published date
  it "creates a book with a valid published date" do
    post books_path, params: { book: { title: "Brave New World", author: "Aldous Huxley", price: 9.99, published_date: Date.today } }
    follow_redirect!
    expect(response.body).to include("Book was successfully created.")
  end

  # published date integration rainy day -- flash message does not appear when book is created with a blank published date
  it "does not create a book with a blank published date (rainy day)" do
    post books_path, params: { book: { title: "Brave New World", author: "Aldous Huxley", price: 9.99, published_date: nil }, }
    expect(response.body).not_to include("Book was successfully created.")
  end
end