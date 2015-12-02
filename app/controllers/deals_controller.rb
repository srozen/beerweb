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
    if @deal.save

      uploaded_io = params[:deal][:picture]
      File.open(Rails.root.join('public', 'images', 'deal_img', "#{ @deal.id }.jpg"), 'wb') do |file|
        file.write(uploaded_io.read)
      end

      flash[:success] = "Bon plan ajouté"
      redirect_to bonsplans_path
    else
      @titre = "Nouveau bon plan"
      render 'new'
    end
  end

  def destroy
    Deal.find(params[:id]).destroy
    flash[:success] = "Bon plan supprimé"
    redirect_to bonsplans_path
  end

  def edit
    @deal = Deal.find(params[:id])
    @title = "Editer le bon plan"
  end

  def update 
    @deal = Deal.find(params[:id])
    if @deal.update_attributes(deal_params)
      
      uploaded_io = params[:deal][:picture]
      File.open(Rails.root.join('public', 'images', 'deal_img', "#{ @deal.id }.jpg"), 'wb') do |file|
        file.write(uploaded_io.read)
      end

      flash[:success] = "Le bon plan a bien été mis à jour !"
      redirect_to bonsplans_path
    else
      @title = "Editer le bon plan"
      render 'edit' 
    end
  end 

  private

    # Rend les paramètres accessibles sur la méthode

    def deal_params
      params.require(:deal).permit(:name, :description, :reference, :start_date, :end_date, :beer_place_type, :beer_place_id, :beer_id)
    end

end
