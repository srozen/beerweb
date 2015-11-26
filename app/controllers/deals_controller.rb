class DealsController < ApplicationController
  def index
    @deals = Deal.all
	  @title = "Bons plans"

    respond_to do |format|
      format.html
      format.json {
        render :json => {
          :deals => @deals
        }
      }
    end
  end

  def new
	@deal = Deal.new
	@title = "Nouveau bon plan"
  end

  def create
    @deal = Deal.new(deal_params)

   
   #### uploaded_io = params[:deals][:picture]
    ######File.open(Rails.root.join('public', 'images', 'deals', "p#{ params[:deal][:id]}.jpg"), 'wb') do |file|
    #file.write(uploaded_io.read)
    #end
    if @deal.save
      redirect_to bonsplans_path
    else
      @titre = "Nouveau bon plan"
      render 'new'
    end
  end

  

  private

    # Rend les paramètres accessibles sur la méthode

    def deal_params
      params.require(:deal).permit(:name, :description, :reference, :start_date, :end_date, :beer_place_type, :beer_place_id, :beer_id)
    end

end
