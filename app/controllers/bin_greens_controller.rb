class BinGreensController < ApplicationController
  # GET /bin_greens
  # GET /bin_greens.json
  def index
    if params[:street_id]
      @bin_greens = Street.friendly.find(params[:street_id]).bin_greens
    else
      @bin_greens = City.friendly.find(params[:city_id]).streets
    end
  end
end
