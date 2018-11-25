class ArtistsController < ApplicationController
  before_action :correct_user, only:[:new, :create, :edit, :update, :destroy]

  def correct_user
      unless admin_signed_in?
        redirect_to root_path
      end
  end

  def index
    @artists = Artist.page(params[:page]).order(artist_kana: "ASC")
  end


  def new
    @artist = Artist.new
    @artist.thumbnails.build
  end

  def create
    artist = Artist.new(artist_params)
    if artist.save
      redirect_to artists_path, flash: {notice:'登録されました'}
    else
      redirect_to new_artist_path, flash: {notice:'登録できていません'}
    end
  end

  def show
    @artist = Artist.find_by(id: params[:id])
  end

  def edit
    @artist = Artist.find_by(id: params[:id])
  end

  def update
    artist = Artist.find_by(id: params[:id])
    if artist.update(artist_params)
      redirect_to artist_path(artist), flash: {notice:'更新されました'}
    else
      redirect_to edit_artist_path(artist.id), flash: {notice:'更新できていません'}
    end
  end

  def destroy
    artist = Artist.find(params[:id])
    if artist.destroy
      redirect_to artists_path, flash: {notice:'削除しました'}
    else
      redirect_to artists_path, flash: {notice:'削除できていません'}
    end
  end

  private

    def artist_params
        params.require(:artist).permit(:artist_name, :artist_details, :artist_kana, thumbnails_images: [])
    end
end
