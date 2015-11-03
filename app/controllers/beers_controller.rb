class BeersController < ApplicationController

  ##
  # Renvoie une entité Beer sur base d'un id
  # @param id :integer
  #
  def show
    @reviews = Review.all
    @nbReviews= Review.where("beer_id = ?", params[:id])

    @beer = Beer.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @beer }
   
    end
  end

end
