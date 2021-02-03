class PicturesController < ApplicationController

  def show
    @picture = Picture.find(params[:id])
    @post = Post.find(@picture.post_id)
    @field = Field.find(@post.field_id)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
