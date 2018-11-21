class FesCommentsController < ApplicationController
  def create
    fe = Fe.find(params[:fe_id])
    comment = current_user.fes_comments.new(fes_comment_params)
    comment.user_id = current_user.id
    comment.fe_id = fe.id
    if comment.save
    redirect_to fe_path(fe)
    end
  end

  def destroy
    fe = Fe.find(params[:fe_id])
    comment = FesComment.find(params[:id])
    if comment.destroy
    	redirect_to fe_path(fe)
    end
  end


  private

    def fes_comment_params
        params.require(:fes_comment).permit(:contents, :user_id, :fe_id)
    end
end

