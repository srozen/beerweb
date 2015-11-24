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
    @deal = Deal.new(params[:user])
    if @deal.save

      flash[:success] = "Bon plan ajouté"
      redirect_to @deals
    else
      @titre = "Nouveau bon plan"
      render 'new'
    end
  end

  
  
end
