class FesCommentsController < ApplicationController
  before_action :correct_user, only:[ :create, :destroy]

  def correct_user
    unless user_signed_in? || admin_signed_in?
      redirect_to root_path
    end
  end

  def create
    fe = Fe.find(params[:fe_id])
    comment = current_user.fes_comments.new(fes_comment_params)
    comment.user_id = current_user.id
    comment.fe_id = fe.id
    if comment.save
      redirect_to fe_path(fe), flash: {notice:'コメントが投稿されました'}
    else
      redirect_to fe_path(fe), flash: {notice:'コメント投稿に失敗しました'}
    end
  end

  def destroy
    fe = Fe.find(params[:fe_id])
    comment = FesComment.find(params[:id])
    if comment.destroy
    	redirect_to fe_path(fe), flash: {notice:'コメントを削除しました'}
    else
      redirect_to fe_path(fe), flash: {notice:'コメント削除できていません'}
    end
  end


  private

    def fes_comment_params
        params.require(:fes_comment).permit(:contents, :user_id, :fe_id)
    end
end

