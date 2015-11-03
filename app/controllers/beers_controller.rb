class BeersController < ApplicationController
  ##
  # Renvoie une entité Beer sur base d'un id
  # @param id :integer
  #
  def show
    @beer = Beer.find(params[:id])
    @beer_category = BeerCategory.find_by_id(@beer.beer_category.id)
    respond_to do |format|
      format.html
      format.json {
        render :json => {
          :beer => @beer, :category => @beer_category
        }
      }
    end
  end
end
