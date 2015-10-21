class BeersController < ApplicationController

  ##
  # Renvoie une entité Beer sur base d'un id
  # @param id :integer
  #
  def show
    @beer = Beer.find(params[:id])
  end

end
