class PlacesController < ApplicationController

  def search
    @places = GooglePlaces.search(params[:search])
  end
end
