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
      format.json {
        @cbeers = []
        @collection_beers.each do |cbeer|
          @nbReviews = Review.where("beer_id = ?", cbeer.id)
          @cbeers << cbeer.as_json.merge(:global_note => @nbReviews.average(:note))
        end
        render :json => {
          :beers => @cbeers,
          :reviews => @collection_reviews
        }
      }
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"beer_collection.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def add_beer

    # @params[:userId]
    # @params[:beerId]
    # @params[:hashpass]
    # @params[:note]
    # @params[:comment]


  end
end
