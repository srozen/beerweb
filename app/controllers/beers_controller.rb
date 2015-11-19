class BeersController < ApplicationController
  before_filter :admin_user,   :only => [:index, :new, :update, :destroy]
  ##
  # Renvoie une entité Beer sur base d'un id
  # @param id :integer
  #

  def index
    @title = "Toutes les bières"
    @users = User.all
  end

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

  def create
    @beer = Beer.new(beer_params)

    ## Ajout de la bière par l'admin
    if signed_in? && current_user.admin?
      @beer.confirmed = true
    end

    if @beer.save
      flash[:success] = "La bière a bien été ajoutée !"
      redirect_to @beer
    else
      @title = "Ajouter une bière"
      render 'new'
    end
  end

  def update
    if !params[:beer][:picture].blank?
      upload_img
    end
    @beer = Beer.find(params[:beer][:id])
    redirect_to @beer
  end

def upload_img
  uploaded_io = params[:beer][:picture]
  File.open(Rails.root.join('public', 'images', 'beer_profile', "#{ params[:beer][:id]}.jpg"), 'wb') do |file|
    file.write(uploaded_io.read)
  end
end

  private

  def beer_params
    params.require(:beer).permit(:name, :degree, :description, :story, :beer_category_id)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
