class BarsController < ApplicationController

  def index
    @bars = Bar.all


    respond_to do |format|
      format.html
      format.json {
        @fullbars = []
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
