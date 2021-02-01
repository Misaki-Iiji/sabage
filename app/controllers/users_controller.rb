class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @fields = Field.joins(:favorites).where("favorites.user_id = ?", @user.id)
    @posts = Post.all
    @pictures = Picture.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "登録情報を編集しました"
    else
      @user = User.find(params[:id])
      redirect_back(fallback_location: edit_user_path)
    end
  end

  def dummy
    redirect_to new_user_registration_path
  end

 private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
