class PostsController < ApplicationController
  def new #写真
    @post = Post.new
    # @post.pictures.build
  end

  def create #写真
    @post = Post.new(post_params)
    @post.save!
    redirect_to post_path(current_field)
    # @field = Field.where(id: params[:id])
    @posts = Post.all
  end

  def show
    @post = Post.where(field_id: current_field.id)
  end

  private
  def post_params
    params.require(:post).permit(:field_id, pictures_images: [])
  end
end
