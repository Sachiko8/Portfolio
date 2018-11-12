class PostsController < ApplicationController

  def show
  end

  def create
    artist = Artist.find(params[:artist_id])
    live = Live.find(params[:live_id])
    post = current_user.posts.new(post_params)
    post.user_id = current_user.id
    post.live_id = live.id
    if post.save
    redirect_to artist_live_path(artist, live)
  end
  end

  def destroy
    artist = Artist.find(params[:artist_id])
    live = Live.find(params[:live_id])
    post = Post.find(params[:id])
    post.destroy
    redirect_to artist_live_path(artist.id, live.id)
  end

  private

    def post_params
        params.require(:post).permit(:contents, :user_id, :live_id)
    end
end
