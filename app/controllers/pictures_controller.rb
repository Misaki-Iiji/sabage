class PicturesController < ApplicationController

 
  end

  def index
    # @field = Field.where(id: params[:id])
  @pictures = Picture.all
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
