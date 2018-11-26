class FavoritesController < ApplicationController
  before_action :correct_user, only:[ :create, :destroy]

  def correct_user
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def create
  	artist = Artist.find(params[:artist_id])
    favorite = current_user.favorites.new(artist_id: artist.id)
    if favorite.save
      redirect_to artist_path(artist.id)
    end
  end

  def destroy
  	artist = Artist.find(params[:artist_id])
    favorite = current_user.favorites.find_by(artist_id: artist.id)
    if favorite.destroy
      redirect_to artist_path(artist.id)
    end
  end

  private

    def favorite_params
        params.require(:favorite).permit(:user_id, :artist_id)
    end

end
