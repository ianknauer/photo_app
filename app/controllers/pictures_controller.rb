class PicturesController < ApplicationController
  
  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(pic_params)
    if @picture.save
      flash[:notice] = "Picture Saved Yo!"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def pic_params
    params.require(:picture).permit(:name, :small_thumb, :large_thumb)
  end
end