class PostsController < ApplicationController
  # 写真
  def new
    @post = Post.new
    # @post.pictures.build
  end

  # 写真
  def create
    @post = Post.new(post_params)
    @post.field_id = current_field.id
    @post.save!
    redirect_to field_path(current_field)
    # @field = Field.where(id: params[:id])
    @posts = Post.all.order(id: 'DESC')
  end

  def show
    @posts = Post.where(field_id: current_field.id).order(id: 'DESC').page(params[:page]).per(10)
  end

  private

  def post_params
    params.require(:post).permit(pictures_images: [])
  end
end
