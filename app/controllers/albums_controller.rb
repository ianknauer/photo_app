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
     params[:pictures]['small_thumb'].each do |a|
      @picture = @album.pictures.create!(:small_thumb => a, :album_id => @album.id)
      end
      redirect_to pictures_path
    else
      render :new
    end

  end

  private

  def album_params
    params.require(:album).permit(:name, pictures_attributes:[:name, :small_thumb])
  end








end