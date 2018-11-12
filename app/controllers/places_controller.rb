class PlacesController < ApplicationController
  def new
    @place = Place.new
    @places = Place.all
  end

  def create
    place = Place.new(place_params)
    place.save
    redirect_to root_path
  end

  def edit
    @place = Place.find_by(id: params[:id])
  end

  def update
    place = Place.find_by(id: params[:id])
    place.update(place_params)
    redirect_to root_path
  end

  def destroy
    place = Place.find(params[:id])
    place.destroy
    redirect_to root_path
  end


  private

    def place_params
        params.require(:place).permit(:place)
    end
end
