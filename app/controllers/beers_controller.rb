class BeersController < ApplicationController
  ##
  # Renvoie une entité Beer sur base d'un id
  # @param id :integer
  #
  def show
    @reviews = Review.all
    @nbReviews= Review.where("beer_id = ?", params[:id])

    @beer = Beer.find(params[:id])
    @beer_category = BeerCategory.find_by_id(@beer.beer_category.id)

    if !params[:userId].nil?
      @collection = Collection.find_by_user_id(params[:userId])
      @review = Review.where("beer_id = ? AND collection_id = ?", @beer.id, @collection.id)
    else
      @review = []
    end

    respond_to do |format|
      format.html
      format.json {
        render :json => {
          :beer => @beer.as_json.merge(:global_note => @nbReviews.average(:note)),
          :category => @beer_category,
          :review => @review
        }
      }
    end
  end
end
