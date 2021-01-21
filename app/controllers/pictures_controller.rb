class PicturesController < ApplicationController

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
