class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update followings followers]

  def index
    @q = User.ransack(params[:q]) # 検索ワードをparams[:q]で受け取り
    @users = @q.result(distinct: true) # 該当した結果をデータ表示
  end

  def show
    @user = User.find(params[:id])
    @fields = Field.joins(:favorites).where('favorites.user_id = ?', @user.id).order(id: 'DESC')
    @pictures = @user.pictures.page(params[:page]).order(id: 'DESC')
    @chat_groups = ChatGroup.joins(:joins).where('joins.user_id = ?', @user.id).order(id: 'DESC')
    @infomations = Infomation.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] = '登録情報を編集しました'
    else
      @user = User.find(params[:id])
      redirect_back(fallback_location: edit_user_path)
      flash[:notice] = '編集は保存されていません'
    end
  end

  # フォローしているユーザー
  def followings
    @user = User.find(params[:id])
    @users = @user.followings.all
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.all
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :introduction, :main_gun, :sub_gun, :image)
  end
end
