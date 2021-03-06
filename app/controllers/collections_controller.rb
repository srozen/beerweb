class CollectionsController < ApplicationController
  #before_filter :authenticateFriends, :only => [:show]


  def show

    if !params[:userId].nil?
      userid = params[:userId]
    else
      userid = params[:id]
    end

    @title = "Ma collection"

    @collection = Collection.find(user_id = userid)
    @beers = Beer.all


    @reviews = @collection.reviews

    @collection_beers = []
    @collection_reviews = []

    ## Pour chaque review, je collecte la bière associée et la review en elle-même dans des tables sparés
    @reviews.each do |review|
      @collection_beers << review.beer
      @collection_reviews << review
    end

    ### API et CSV
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

  ### API
  def add_beer

    # @params[:userId]
    # @params[:beerId]
    # @params[:hash]
    # @params[:note]
    # @params[:comment]

    # Voir si les premiers champs sont validates
    # Voir si le user est correct
    # Ajouter la review + compléter la collection

    @beer_exists = Beer.exists?(:id => params[:beerId])
    @user_exists = User.exists?(:id => params[:userId])

    if(@user_exists && @beer_exists)
      @user = User.authenticate_by_mobile(params[:userId], params[:hash])
      if @user.nil?
        render :json => {
          :success => false
        }
      else
        @review = Review.new(:note => params[:note], :comment => params[:comment], :beer_id => params[:beerId])
        @collection = Collection.find(user_id = @user.id)
        @allreviews = @collection.reviews.all
        @collection_beers = []

        @allreviews.each do |review|
          @collection_beers << review.beer.id
        end

        if @collection_beers.include?(params[:beerId])
          render :json => {
            :success => false
          }
        end
        @review.collection = @collection
        @review.save

        render :json => {
          :success => true
        }
      end
    else
      render :json => {
        :success => false
      }
    end
  end

  ### API
  def delete_beer

    # @params[:userId]
    # @params[:hash]
    # @params[:reviewId]

    # Vérifier les infos User
    # Retrouver la review du User
    # Destroy la Review

    @user_exists = User.exists?(:id => params[:userId])
    @review_exists = Review.exists?(:id => params[:reviewId])

    if(@user_exists && @review_exists)
      @user = User.authenticate_by_mobile(params[:userId], params[:hash])
      if @user.nil?
        render :json => {
          :success => false
        }
      else
        Review.find_by_id(params[:reviewId]).destroy
        render :json => {
          :success => true
        }
      end
    else
      render :json => {
        :success => false
      }
    end
  end

end

  def authenticateFriends
    @user = User.find(params[:id])
    deny_access_friends unless current_user?(@user) || isFriend?
  end
