class BeersController < ApplicationController
  before_filter :admin_user,   :only => [:new, :update, :destroy]
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

  def new
    @beer = Beer.new
    @title = "Ajouter une bière"
    @beer_categories = BeerCategory.all
  end


  private

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
