class BeerCategoriesController < ApplicationController

  def index
    @beers = Beer.all
  end

end
