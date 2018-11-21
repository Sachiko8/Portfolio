class FesController < ApplicationController

def index
    @fes = Fe.all.order(fes_day: "DESC")
  end


  def new
    @fes = Fe.new
  end

  def create
    fes = Fe.new(fe_params)
    if fes.save
       redirect_to fes_path
   end
  end

  def show
    @fe = Fe.find(params[:id])
    @comment = FesComment.new
    @comments = @fe.fes_comments
  end

  def edit
    @fes = Fe.find_by(id: params[:id])
  end

  def update
    fes = Fe.find_by(id: params[:id])
    if fes.update(fe_params)
       redirect_to fes_path
   end
  end

  def destroy
    fes = Fe.find(params[:id])
    if fes.destroy
       redirect_to fes_path
   end
  end

  private

    def fe_params
        params.require(:fe).permit(:fes_name, :place_id, :fes_day)
    end
end
