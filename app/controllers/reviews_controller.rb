class ReviewsController < ApplicationController

    def show
      @beer = Beer.find(params[:id])

      @reviews = Review.all
      @nbReviews= Review.where("beer_id = ?", @beer.id) 
      
      @collections = Collection.all
      @users = User.all
      @titre = "Reviews"
    end



end
