class FesLikesController < ApplicationController
	def create
    fes = Fe.find(params[:fe_id])
    comment = FesComment.find(params[:fes_comment_id])
    like = current_user.fes_likes.new(fes_comment_id: params[:fes_comment_id])
    if like.save
       redirect_to fe_path(fes)
   end
  end

  def destroy
    fes = Fe.find(params[:fe_id])
    comment = FesComment.find(params[:fes_comment_id])
  	like = current_user.fes_likes.find_by(fes_comment_id: params[:fes_comment_id])
    if like.destroy
    	redirect_to fe_path(fes)
    end
  end

  private

    def fes_like_params
        params.require(:fes_like).permit(:user_id, :fes_comment_id)
    end
end
