class SearchController < ApplicationController
    def index
      @cities = City.all
      @streets = Street.all
    end
  
    def search_streets
      @streets = City.friendly.find(params[:city]).streets
  
      respond_to do |format|
        format.json { render :json => @streets }
      end
    end 
  
    def search
      # @city = City.friendly.find(params[:city]).slug
      # @street = Street.friendly.find(params[:street]).slug
      # @poubelles = City.friendly.find(params[:city]).streets.where(id: params[:street])
  
      if params[:street].present?
        city = City.friendly.find(params[:city]).slug
        street = Street.friendly.find(params[:street]).slug
        @url = "/villes/#{city}/#{street}"
      elsif params[:street].present?
        city = City.friendly.find(params[:city]).slug
        street = Street.friendly.find(params[:street]).slug
        @url = "/villes/#{@city}/#{@street}"
      elsif params[:city].present?
        city = City.friendly.find(params[:city]).slug
        @url = "/villes/#{city}"
      end
  
      respond_to do |format|
        format.html {redirect_to @url}
      end
    end
  end