class TopsController < ApplicationController
  def top
  	@artists = Artist.order("RANDOM()").limit(4)
  end

  def about
  end
end
