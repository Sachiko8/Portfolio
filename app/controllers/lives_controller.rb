class LivesController < ApplicationController
  before_action :correct_user, only:[:new, :create, :edit, :update, :destroy]

  def correct_user
      unless admin_signed_in?
        redirect_to root_path
      end
  end

  def show
    @artist = Artist.find(params[:artist_id])
    @live = Live.find_by(id: params[:id])
    @comment = Comment.new
    @comments = @live.comments.page(params[:page]).reverse_order.order(created_at: "ASC")
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @live = Live.new
  end

  def create
    live = Live.new(live_params)
    artist = Artist.find(params[:artist_id])
    live.artist_id = artist.id
    if live.save
      redirect_to artist_path(artist.id), flash: {notice:'登録されました'}
    else
      redirect_to new_artist_live_path(artist.id), flash: {notice:'登録できていません'}
    end
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @live = Live.find(params[:id])
  end

  def update
    live = Live.find(params[:id])
    if live.update(live_params)
      redirect_to artist_path(live.artist_id), flash: {notice:'更新されました'}
    else
      redirect_to edit_artist_live_path(live.artist_id), flash: {notice:'更新できていません'}
    end
  end

  def destroy
    live = Live.find(params[:id])
    if live.destroy
      redirect_to artist_path(live.artist_id), flash: {notice:'削除しました'}
    else
      redirect_to artist_path(live.artist_id), flash: {notice:'削除できていません'}
    end
  end

  private

    def live_params
        params.require(:live).permit(:artist_id, :when, :live_title, :place_id,)
    end

end
