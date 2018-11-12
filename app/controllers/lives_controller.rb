class LivesController < ApplicationController
  def show
    @artist = Artist.find(params[:artist_id])
    @live = Live.find(params[:id])
    @post = Post.new
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @live = Live.new
  end

  def create
    live = Live.new(live_params)
    artist = Artist.find(params[:artist_id])
    live.artist_id = artist.id
    live.save
    redirect_to artist_path(artist.id)
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @live = Live.find(params[:id])
  end

  def update
    live = Live.find(params[:id])
    live.update(live_params)
    redirect_to artist_path(live.artist_id)
  end

  def destroy
    live = Live.find(params[:id])
    live.destroy
    redirect_to artist_path(live.artist_id)
  end

  private

    def live_params
        params.require(:live).permit(:artist_id, :when, :live_title, :place_id,)
    end

end
