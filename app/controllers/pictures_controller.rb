class PicturesController < ApplicationController

  def show
    @picture = Picture.where(id: params[:id])
    @post = Picture.find_by(params[:id])
    @field = Field.find_by(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
