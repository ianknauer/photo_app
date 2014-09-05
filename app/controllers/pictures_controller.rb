class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end
  
  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(pic_params)
    if @picture.save
      flash[:notice] = "Picture Saved Yo!"
      redirect_to pictures_path
    else
      render :new
    end
  end

  private

  def pic_params
    params.require(:picture).permit(:small_thumb)
  end

end