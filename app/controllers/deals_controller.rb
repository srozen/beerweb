class DealsController < ApplicationController
  def index
    @deals = Deal.all
	@title = "Bons plans"
  end

  def new
	@deal = Deal.new
	@title = "Nouveau bon plan"
  end

  def create
    @deal = Deal.new(deal_params)
    if @deal.save

      flash[:success] = "Bon plan ajouté"
      redirect_to @deals
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
