class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      @user = User.find(params[:id])
      redirect_back(fallback_location: edit_user_path)
    end
  end

 private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
