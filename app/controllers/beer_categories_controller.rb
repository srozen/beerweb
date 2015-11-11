class BeerCategoriesController < ApplicationController

  # Utilise la méthode search du Beer pour renvoyer des bières
  def index
    @title = "Catalogue"
    @beers = Beer.search(params[:name])

    respond_to do |format|
        format.html
        format.json {

          @cbeers = []
          @beers.each do |beer|
            @nbReviews= Review.where("beer_id = ?", beer.id)
            @cbeers << beer.as_json.merge(:global_note => @nbReviews.average(:note))
          end

          render :json => {
            :beers => @cbeers
          }
        }
    end
  end

  def show
    @category = BeerCategory.find(params[:id])
    @title = @category.name
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
