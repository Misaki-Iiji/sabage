class PictureHitsController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    picture_hit = current_user.picture_hits.new(picture_id: @picture.id)
    picture_hit.save
    @post = Post.find(params[:post_id])
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    picture_hit = current_user.picture_hits.find_by(picture_id: @picture.id)
    picture_hit.destroy
    @post = Post.find(params[:post_id])
  end
end
