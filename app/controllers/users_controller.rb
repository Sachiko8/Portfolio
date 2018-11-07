class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if
      user = User.find(params[:id])
      user.update(user_params)
      redirect_to user_path(user)
    else
      redirect_to root_path
  end
  end

  def destroy
    if
      user = User.find(params[:id])
      user.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
    def user_params
        params.require(:user).permit(:user_name, :nickname, :profile_image)
    end
end
