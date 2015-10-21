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
end
