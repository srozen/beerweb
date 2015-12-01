class BarsController < ApplicationController

  def index
    @bars = Bar.all


    respond_to do |format|
      format.html
      format.json {
        @fullbars = []
        user = User.find(params[:userId])
        user.latitude = params[:latitude].to_f
        user.longitude = params[:longitude].to_f
        user.last_connection = DateTime.current
        user.save
        @bars.each do |bar|
          @fullbars << bar.as_json.merge(:contact => bar.contact_detail)
        end

        render :json => {
          :bars => @fullbars
        }
      }
    end
  end
end
