class UsersController < ApplicationController
  before_action :correct_user, only:[:edit, :update, :destroy, :show]

  def correct_user
    @user = User.find(params[:id])
    if @user == current_user
      elsif admin_signed_in?
      else  redirect_to root_path
      end
  end

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
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(user), flash: {notice:'更新されました'}
    else
      redirect_to edit_user_path(user.id), flash: {notice:'更新できていません'}
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      redirect_to root_path, flash: {notice:'退会しました'}
    else
      redirect_to user_path(user.id), flash: {notice:'退会できていません'}
    end
  end

  def favorites_list
    @user = User.find(params[:id])
    favorites = @user.favorites
    artists = favorites.pluck(:artist_id)
    @artists = Artist.where(id: artists).order(artist_kana: "ASC")
  end

  private
    def user_params
        params.require(:user).permit(:user_name, :nickname, :profile_image)
    end
end
