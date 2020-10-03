class StreetsController < ApplicationController
  before_action :check_city, only: [:show]
  before_action :set_street, only: [:show]
  before_action :set_city

  # GET /streets
  # GET /streets.json
  def index
    @streets = City.friendly.find(params[:city_id]).streets
  end

  # GET /streets/1
  # GET /streets/1.json
  def show
    @bin_recycles = @street.bin_recycles.first
    @bin_wastes = @street.bin_wastes.first
    @bin_greens = @street.bin_greens.first
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_street
      @street = Street.friendly.find(params[:id])
    end

    def set_city
      @city = City.friendly.find(params[:city_id])
    end

    def check_city
        unless City.friendly.find(params[:city_id]).streets.find_by(slug: params[:id]).present?
          redirect_to root_path
        end
    end

    # Only allow a list of trusted parameters through.
    def street_params
      params.fetch(:street, {})
    end
end
