class FesController < ApplicationController
  before_action :correct_user, only:[:new, :create, :edit, :update, :destroy]

  def correct_user
      unless admin_signed_in?
        redirect_to root_path
      end
  end

  def index
    @fes = Fe.all.order(fes_day: "DESC")
  end


  def new
    @fes = Fe.new
  end

  def create
    fes = Fe.new(fe_params)
    if fes.save
      redirect_to fes_path, flash: {notice:'登録されました'}
    else
      redirect_to new_fe_path, flash: {notice:'登録できていません'}
    end
  end

  def show
    @fe = Fe.find(params[:id])
    @comment = FesComment.new
    @comments = @fe.fes_comments.page(params[:page]).reverse_order.order(created_at: "ASC")
  end

  def edit
    @fes = Fe.find_by(id: params[:id])
  end

  def update
    fes = Fe.find_by(id: params[:id])
    if fes.update(fe_params)
      redirect_to fes_path, flash: {notice:'更新されました'}
    else
      redirect_to edit_fe_path(fes.id), flash: {notice:'更新できていません'}
    end
  end

  def destroy
    fes = Fe.find(params[:id])
    if fes.destroy
      redirect_to fes_path, flash: {notice:'削除しました'}
    else
      redirect_to fes_path, flash: {notice:'削除できていません'}
    end
  end

  private

    def fe_params
        params.require(:fe).permit(:fes_name, :place_id, :fes_day)
    end
end
