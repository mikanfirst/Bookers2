class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]


  def index
    @users = User.all
    @newbook = Book.new
  end

  def show
    @user = User.find(params[:id])
    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'You have updated user successfully'
      redirect_to user_path(@user) #25行目を@userで定義しており代入されている値(params)にidも入っているためuser_path(user.id)じゃなく@user
    else
      render "edit"
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user ==current_user
      redirect_to user_path(current_user)
    end
  end

end
