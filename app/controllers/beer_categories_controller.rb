class BeerCategoriesController < ApplicationController

  # Utilise la méthode search du Beer pour renvoyer des bières
  def index
    @beers = Beer.search(params[:name])

    respond_to do |format|
        format.html
        format.json { render json: @beers }
    end
  end
end
