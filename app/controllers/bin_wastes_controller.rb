class BinWastesController < ApplicationController
  # GET /bin_wastes
  # GET /bin_wastes.json
  def index
    if params[:street_id]
      @bin_wastes = Street.friendly.find(params[:street_id]).bin_wastes
    else
      @bin_wastes = City.friendly.find(params[:city_id]).streets
    end
  end
end
