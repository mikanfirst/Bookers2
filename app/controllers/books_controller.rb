class BooksController < ApplicationController
  def index
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to '/books'
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:name, :body)
  end
end
