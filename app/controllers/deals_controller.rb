class DealsController < ApplicationController
  def index
    @deals = Deal.all
	@title = "Bons plans"
  end
  
  def new
	@deals = Deal.new
	@title = "Nouveau bon plan"
  end
  
  def destroy
    Deal.find(params[:id]).destroy
    flash[:success] = "Deal destroy"
    redirect_to deals_url
  end
end
