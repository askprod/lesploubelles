class MapController < ApplicationController
  def index
    @cities = City.all
    @streets = Street.all
  end

  def get_streets_by_city
    @streets = City.find(params[:city_id]).streets

    puts @streets

    respond_to do |format|
      format.json { render :json => @streets }
    end
  end 

  def search
    puts "*******************"
    puts params
      @poubelles = City.find(params[:city]).streets.where(id: params[:street])
      @poubelles.each do |p|
        puts p.id
      end
  end
end
