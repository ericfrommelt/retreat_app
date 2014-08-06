class GetawaysController < ApplicationController

  def new
    @getaway = Getaway.new
  end

  def create
    @getaway = Getaway.create!(getaways_params)

    redirect_to getaway_path(@getaway)
  end

  def show
    @getaway = Getaway.find(params[:id])
  end

  def getaways_params
    params.require(:getaway).permit(:city, :country, :comment, :departure_date, :user_id)
  end
end
