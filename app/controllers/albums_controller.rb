class AlbumsController < ApplicationController

  def index
    @albums = Customer.find_by(slug: params[:customer_id]).albums
  end

  def new
    @album = Album.new
    @album.pictures.build
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      params[:pictures]['small_thumb'].each do |a|
        @picture = @album.pictures.create!(:small_thumb => a, :album_id => @album.id, :name => "image")
      end
      redirect_to root
    else
      render :new
    end
  end

  def show
    @album = Album.find_by_id(params[:id])
  end

  private

  def album_params
    params.require(:album).permit(:name, pictures_attributes:[:name, :small_thumb])
  end








end