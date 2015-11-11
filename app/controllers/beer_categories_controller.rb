class BeerCategoriesController < ApplicationController

  # Utilise la méthode search du Beer pour renvoyer des bières
  def index
    @title = "Catalogue"
    @beers = Beer.search(params[:name])

    respond_to do |format|
        format.html
        format.json { render :json => {
            :beers => @beers
          }
        }
    end
  end

  def show
    @category = BeerCategory.find(params[:id])
    @category_beers = Beer.where(:beer_category_id => @category.id)

    respond_to do |format|
      format.html
      format.json {render :json => {
          :category => @category, :beers => @category_beers
        }
      }
    end
  end
end
