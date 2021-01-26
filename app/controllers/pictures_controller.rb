class PicturesController < ApplicationController

  def show
    @picture = Picture.where(id: params[:id])
    @post = Picture.post_id
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
