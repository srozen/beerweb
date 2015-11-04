class DealsController < ApplicationController
  def index
    @deals = Deal.all
	@title = "Bons plans"
  end
  
  def new
	@deal = Deal.new
	@title = "Nouveau bon plan"
  end
  
end
