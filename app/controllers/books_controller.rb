class BooksController < ApplicationController
  def index
    @newbook = Book.new
    @books = Book.all
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
       flash[:success] = 'You have created book successfully.'
      redirect_to book_path(book.id)
    else
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end


  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:success] = 'You have update book successfully.'
      redirect_to book_path(book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
