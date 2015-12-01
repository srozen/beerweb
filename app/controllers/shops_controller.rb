class ShopsController < ApplicationController

  def index

    @shops = Shop.all

    respond_to do |format|
      format.html
      format.json {
        @fullshops = []
        user = User.find(params[:userId])
        user.latitude = params[:latitude].to_f
        user.longitude = params[:longitude].to_f
        user.last_connection = DateTime.current
        user.save
        @shops.each do |shop|
          @fullshops << shop.as_json.merge(:contact => shop.contact_detail)
        end
        render :json => {
          :shops => @fullshops
        }
      }
    end
  end
end
