class CollectionsController < ApplicationController
  def show
    @collection = Collection.find(user_id = params[:id])

    @beers = Beer.all
  end
end
