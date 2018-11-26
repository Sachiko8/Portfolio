class CommentsController < ApplicationController
  before_action :correct_user, only:[ :create, :destroy]

  def correct_user
    unless user_signed_in? || admin_signed_in?
      redirect_to root_path
    end
  end

  def create
    artist = Artist.find(params[:artist_id])
    live = Live.find(params[:live_id])
    comment = current_user.comments.new(comment_params)
    comment.user_id = current_user.id
    comment.live_id = live.id
    if comment.save
      redirect_to artist_live_path(artist.id, live.id), flash: {notice:'コメントが投稿されました'}
    else
      redirect_to artist_live_path(artist.id, live.id), flash: {notice:'コメント投稿に失敗しました'}
    end
  end

  def destroy
    artist = Artist.find(params[:artist_id])
    live = Live.find(params[:live_id])
    comment = Comment.find(params[:id])
    if comment.destroy
    	redirect_to artist_live_path(artist, live), flash: {notice:'コメントを削除しました'}
    else
      redirect_to artist_live_path(artist, live), flash: {notice:'コメント削除できていません'}
    end
  end

  private

    def comment_params
        params.require(:comment).permit(:contents, :user_id, :live_id)
    end
end
