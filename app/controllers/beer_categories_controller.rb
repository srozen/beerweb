class BeerCategoriesController < ApplicationController

  # Utilise la méthode search du Beer pour renvoyer des bières
  def index
    @title = "Catalogue"
    @beers = Beer.search(params[:name])

    respond_to do |format|
        format.html
        format.json {
          if !params[:userId].nil?
            userid = params[:userId]

            # Récupération des reviews du user
            @collection = Collection.find(user_id = userid)
            @reviews = @collection.reviews
          else
            @reviews = []
          end



          @cbeers = []
          @beers.each do |beer|
            @nbReviews= Review.where("beer_id = ?", beer.id)
            @cbeers << beer.as_json.merge(:global_note => @nbReviews.average(:note))
          end

          render :json => {
            :beers => @cbeers,
            :reviews => @reviews
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
