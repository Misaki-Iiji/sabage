class PicturesController < ApplicationController
  def show
    @picture = Picture.find(params[:id])
    @post = Post.find(@picture.post_id)
    @field = Field.find(@post.field_id)
  end

  def destroy
    Picture.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to field_path(params[:field_id])
  end
end
