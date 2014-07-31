class AlbumsController < ApplicationController 

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(user_params)
    if @album.save
      flash[:notice] = "album is created!"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def album_params
    params.require(:album).permit(:name)
  end

end