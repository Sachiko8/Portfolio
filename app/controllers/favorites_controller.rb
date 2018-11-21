class FavoritesController < ApplicationController
  def index
    favorites = current_user.favorites
    artists = favorites.pluck(:artist_id)
    @artists = Artist.where(id: artists).order(artist_kana: "ASC")
  end

  def create
  	artist = Artist.find(params[:artist_id])
    favorite = current_user.favorites.new(artist_id: artist.id)
    if favorite.save
      redirect_to artists_path
    end
  end

  def destroy
  	artist = Artist.find(params[:artist_id])
    favorite = current_user.favorites.find_by(artist_id: artist.id)
    if favorite.destroy
      redirect_to artists_path
    end
  end

  private

    def favorite_params
        params.require(:favorite).permit(:user_id, :artist_id)
    end

end
