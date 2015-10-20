class BeerCategoriesController < ApplicationController

  # Utilise la méthode search du Beer pour renvoyer des bières
  def index
    @beers = Beer.search(params[:name])
  end

end
