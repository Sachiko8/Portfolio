class CommentsController < ApplicationController

  def create

    artist = Artist.find(params[:artist_id])
    live = Live.find(params[:live_id])
    comment = current_user.comments.new(comment_params)
    comment.user_id = current_user.id
    comment.live_id = live.id
    if comment.save
    redirect_to artist_live_path(artist.id, live.id)
    end
  end

  def destroy
    artist = Artist.find(params[:artist_id])
    live = Live.find(params[:live_id])
    comment = Comment.find(params[:id])
    if comment.destroy
    	redirect_to artist_live_path(artist, live)
    end
  end

  private

    def comment_params
        params.require(:comment).permit(:contents, :user_id, :live_id)
    end
end
