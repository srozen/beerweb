class CollectionsController < ApplicationController
  def show

    if !params[:userId].nil?
      userid = params[:userId]
    else
      userid = params[:id]
    end

    @collection = Collection.find(user_id = userid)
    @beers = Beer.all


    @reviews = @collection.reviews
    @collection_beers = []
    @collection_reviews = []

    @reviews.each do |review|
      @collection_beers << review.beer
      @collection_reviews << review
    end

    respond_to do |format|
      format.html
      format.json {render :json => {
          :beers => @collection_beers,
          :reviews => @collection_reviews
        }
      }
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"beer_collection.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end
end
