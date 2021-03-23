class UsersController < ApplicationController
  
  def index
    @users = User.all
    @newbook = Book.new
  end
  
  def show
    @user = User.find(params[:id])
  end
end
