class BooksController < ApplicationController
  #look up book by URL
   before_action :set_book, only: [:show, :edit, :update, :delete, :confirm_delete]

   #The index page should load all the books, so the view can list them
  def index
    @books = Book.all
  end

  def show
  end

  #Builds a new book 
  def new
    @book = Book.new
  end

  #Create a new book with the whitelisted parameters
  #If it succeeds, redirect to the home page with a flash message
  #Otherwise, re-render the new form, user can see validation errors and try again
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path, notice: "Book was successfully created."
    else
      render :new
    end
  end

  def edit
  end

#updating a book: attempt, redirect to home page with flash message upon success
#Re-render if failed 
  def update
    if @book.update(book_params)
      redirect_to root_path, notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  def confirm_delete
    end

    #permanently remove book, redirect to home page 
  def delete
    @book.destroy
    redirect_to root_path, notice: "Book was successfully deleted."
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  #Require title, author, price, and publish date to be present
  def book_params
    params.require(:book).permit(:title, :author, :price, :published_date)
  end
end