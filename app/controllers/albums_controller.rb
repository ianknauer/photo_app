class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def new 
    @album = Album.new
    @album.pictures.build
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:notice] = "Album Created!"
      redirect_to albums_path
    else
      render :new
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, pictures_attributes:[:name, :small_thumb])
  end








end