class PagesController < ApplicationController

  def home
	  @titre = "Accueil"
  end

  def collection
	  @titre = "Collection"
  end

  def contact
	 @titre = "Contact"
  end

  def about
	 @titre = "A Propos"
  end

  def help
    @title = "Aide"
  end
  def beermap
    @title = "beermap"
    @bars = Bar.all 
    @shops = Shop.all
    @contact_details = ContactDetail.all 
  end

  
end
