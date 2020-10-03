class SearchController < ApplicationController
    def index
      @cities = City.all
      @streets = Street.all
    end
  
    def search_streets
      @streets = City.friendly.find(params[:city]).streets

      respond_to do |format|
        format.json { render json: @streets.to_json, status: 200 }
      end
    end 
  
    def search
      if params[:street].present?
        city = City.find_by(name: params[:city]).slug
        street = Street.find_by(name: params[:street]).slug
        @url = "/villes/#{city}/#{street}"
      elsif params[:street].present?
        city = City.find_by(name: params[:city]).slug
        street = Street.find_by(name: params[:street]).slug
        @url = "/villes/#{@city}/#{@street}"
      elsif params[:city].present?
        city = City.find_by(name: params[:city]).slug
        @url = "/villes/#{city}"
      end
  
      respond_to do |format|
        format.html {redirect_to @url}
      end
    end

    def city_autocomplete
      render json: City.search(params[:city], {
        fields: ["name"],
        match: :word_start,
        limit: 10,
        load: false,
        misspellings: {below: 2}
      }).map(&:name)
    end
end