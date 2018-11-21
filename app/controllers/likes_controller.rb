class LikesController < ApplicationController
  def create
  	artist = Artist.find(params[:artist_id])
    live = Live.find(params[:live_id])
    comment = Comment.find(params[:comment_id])
    like = current_user.likes.new(comment_id: params[:comment_id])
    if like.save
      redirect_to artist_live_path(artist, live)
    end
  end

  def destroy
  	artist = Artist.find(params[:artist_id])
    live = Live.find(params[:live_id])
    comment = Comment.find(params[:comment_id])
  	like = current_user.likes.find_by(comment_id: params[:comment_id])
    if like.destroy
      redirect_to artist_live_path(artist, live)
    end
  end


  private

    def like_params
        params.require(:like).permit(:user_id, :comment_id)
    end
end
