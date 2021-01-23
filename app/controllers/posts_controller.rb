class PostsController < ApplicationController
  def new #写真
    @post = Post.new
    # @post.pictures.build
  end

  def create #写真
    @post = Post.new(post_params)
    @post.field_id = current_field.id
    @post.save!
    redirect_to post_path(current_field)
    # @field = Field.where(id: params[:id])
    @posts = Post.all
  end

  def show
    @posts = Post.where(field_id: current_field.id)
    puts "---"
    pp @posts
    puts "---"
  end

  private
  def post_params
    params.require(:post).permit(pictures_images: [])
  end
end