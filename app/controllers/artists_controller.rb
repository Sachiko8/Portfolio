class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
    @artist.thumbnails.build
  end

  def create
    artist = Artist.new(artist_params)
    binding.pry
    artist.save
    redirect_to artists_path
  end

  def show
    @artist = Artist.find_by(id: params[:id])
  end

  def edit
    @artist = Artist.find_by(id: params[:id])
  end

  def update
    artist = Artist.find_by(id: params[:id])
    artist.update(user_params)
    redirect_to artist_path(artist)
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to artist_path(artist)
  end

  private

    def artist_params
        params.require(:artist).permit(:artist_name, :artist_details, thumbnails_images: [])
    end
end
