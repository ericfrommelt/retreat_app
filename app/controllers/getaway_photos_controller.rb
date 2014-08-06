class GetawayPhotosController < ApplicationController

  def index
    @photos = GetawayPhoto.all
  end

  def new
    @photo = GetawayPhoto.new
    @getaways = Getaway.all
  end


  def create
    @photo = GetawayPhoto.new(photo_params)
    @getaway = @photo.getaway
    redirect_to getaway_path(@getaway)
  end


  def show
    @photo = GetawayPhoto.find(params[:id])
  end

  def edit
    @photo = GetawayPhoto.find(params[:id])
  end

  def update
    @photo = GetawayPhoto.find(params[:id])
    @photo.update(photo_params)
    redirect_to getaway_photo(@photo)
  end

  def destroy
    @photo = GetawayPhoto.find(params[:id])
    @photo.destroy
    redirect_to getaway_photo(@photo)
  end

  private
  def photo_params
    params.require(:getaway_photo).permit(:photo, :getaway_id)
  end


end
