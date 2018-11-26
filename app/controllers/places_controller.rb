class PlacesController < ApplicationController
  before_action :correct_user, only:[:new, :create, :edit, :update, :destroy]

  def correct_user
      unless admin_signed_in?
        redirect_to root_path
      end
  end

  def new
    @place = Place.new
    @places = Place.all
  end

  def create
    place = Place.new(place_params)
    if place.save
      redirect_to new_place_path, flash: {notice:'登録されました'}
    else
      redirect_to new_place_path, flash: {notice:'登録できていません'}
    end
  end

  def edit
    @place = Place.find_by(id: params[:id])
  end

  def update
    place = Place.find_by(id: params[:id])
    if place.update(place_params)
      redirect_to new_place_path, flash: {notice:'更新されました'}
    else
      redirect_to edit_place_path(place.id), flash: {notice:'更新できていません'}
    end
  end

  def destroy
    place = Place.find(params[:id])
    if place.destroy
      redirect_to new_place_path, flash: {notice:'削除しました'}
    else
      redirect_to new_place_path, flash: {notice:'削除できていません'}
    end
  end


  private

    def place_params
        params.require(:place).permit(:place)
    end
end
