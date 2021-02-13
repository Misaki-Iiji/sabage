class ChatGroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = ChatGroup.ransack(params[:q])
    @chat_groups = @q.result(distinct: true).page(params[:page])
  end

  def new
    @chat_group = ChatGroup.new
  end

  def create
    chat_group = ChatGroup.new(chat_group_params)
    chat_group_to_user = ChatGroupToUser.new(chat_group: chat_group, user: current_user)
    if chat_group_to_user.save
      redirect_to action: 'index'
      flash[:notice] = 'Clanを作成しました'
    else
      render 'new'
      flash[:notice] = 'Clan名20文字以内、説明文200文字以内'
    end
  end

  def edit
    @chat_group = ChatGroup.find(params[:id])
  end

  def update
    chat_group = ChatGroup.find(params[:id])
    if chat_group.update(chat_group_params)
      redirect_to action: 'index'
      flash[:notice] = '編集しました。'
    else
      render action: 'edit'
      flash[:notice] = '編集に失敗しました。'
    end
  end

  def destroy
    chat_group = ChatGroup.find(params[:id])
    if chat_group.destroy
      redirect_to action: 'index'
      flash[:notice] = 'Clan削除しました。'
    else
      render 'edit'
      flash[:notice] = 'Clan削除に失敗しました。'
    end
  end

  private

  def chat_group_params
    params.require(:chat_group).permit(:chat_group_name, :chat_group_description, user_ids: [])
  end
end
