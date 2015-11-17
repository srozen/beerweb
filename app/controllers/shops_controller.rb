class ShopsController < ApplicationController

  def index

    @shops = Shop.all

    respond_to do |format|
      format.html
      format.json {
        @fullshops = []
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
