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
    @stay_activities = @getaway.activities.where(category: 'stay')
    @eat_activities = @getaway.activities.where(category: 'eat')
    @play_activities = @getaway.activities.where(category: 'play')
  end

  def edit
    @getaway = Getaway.find(params[:id])
  end

  def update
    @getaway = Getaway.find(params[:id])
    @getaway.update(getaways_params)
    if @getaway.save
      redirect_to getaway_path(@getaway)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @getaway = Getaway.find(params[:id])
    @getaway.destroy
    redirect_to user_path(@user)
  end

  def getaways_params
    params.require(:getaway).permit(:city, :country, :comment, :departure_date, :user_id)
  end
end
