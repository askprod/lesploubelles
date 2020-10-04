class BinRecyclesController < ApplicationController
  # GET /bin_recycles
  # GET /bin_recycles.json
  def index
    if params[:street_id]
      @bin_recycles = Street.friendly.find(params[:street_id]).bin_recycles
    else
      @bin_recycles = City.friendly.find(params[:city_id]).streets
    end
  end
end
