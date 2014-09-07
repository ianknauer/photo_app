class AlbumsController < ApplicationController

  def index
  end

  def new
    @customer = Customer.find_by(email: "ian.knauer@gmail.com")
    @album = Album.new
    @album.pictures.build
  end

  def create
    @album = Album.new(merge_album_and_customer)
    if @album.save
      params[:pictures]['small_thumb'].each do |a|
        @picture = @album.pictures.create!(:small_thumb => a, :album_id => @album.id, :name => "image")
      end
      redirect_to home_path
    else
      render :new
    end
  end

  def show
    @album = Album.find_by slug: params[:id]
  end

  private

  def album_params
    params.require(:album).permit(:customer_id, :name, pictures_attributes:[:small_thumb])
  end

  def merge_album_and_customer
    album_params.merge!(customer_id: (Customer.find_by(slug: params[:customer_id]).id))
  end
end