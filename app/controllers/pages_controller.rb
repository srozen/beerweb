class PagesController < ApplicationController

  def index

  end
  def collection
	@titre = "Collection"
  end

  def contact
	 @titre = "Contact"
  end
end
