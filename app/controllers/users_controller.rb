class UsersController < ApplicationController
  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user =  User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  
  def index
    @book_new = Book.new
    @user = User.find(current_user.id)
    @users = User.all
  end
  
   private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
