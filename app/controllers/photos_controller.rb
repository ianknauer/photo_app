class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create 
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "Welcome to the party"
      redirect_to root_path
    else
      render :new
    end

  
  private

  def photo_params
    params.require(:photo).permit(:name, :small_thumb, :large_thumb)
  end
end