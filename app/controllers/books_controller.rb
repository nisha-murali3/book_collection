class BooksController < ApplicationController
  #look up book by URL
   before_action :set_book, only: [:show, :edit, :update, :delete, :confirm_delete]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  #creating a new book, currently redirect to home page with a flash message
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

#updating a book 
  def update
    if @book.update(book_params)
      redirect_to root_path, notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  def confirm_delete
    end

  def delete
    @book.destroy
    redirect_to root_path, notice: "Book was successfully deleted."
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title)
  end
end