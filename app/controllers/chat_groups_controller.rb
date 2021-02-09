class ChatGroupsController < ApplicationController

  def index
    @chat_groups = ChatGroup.all.page(params[:page])
    @q = ChatGroup.ransack(params[:q])
    @chats = @q.result(distinct: true)
  end

  def new
    @chat_group = ChatGroup.new
  end

  def create
    chat_group = ChatGroup.new(chat_group_params)
    chat_group_to_user = ChatGroupToUser.new(chat_group_id: chat_group, user_id: current_user)
    if chat_group_to_user.save
      redirect_to action: 'index'
      flash[:notice] = "Clanを作成しました"
    else
      render 'new', alert: "Clan作成に失敗しました"
    end
  end

  def edit
    @chat_group = ChatGroup.find(params[:id])
  end

  def update
    chat_group = ChatGroup.find(params[:id])
    if chat_group.update(chat_group_params)
      redirect_to action: 'index'
      flash[:notice] = "編集しました"
    else
      render action: 'edit'
    end
  end

  def destroy
    chat_group = ChatGroup.find(params[:id])
    if chat_group.destroy
      redirect_to action: 'index'
    else
      render 'edit'
      flash[:notice] = "Clan更新に失敗しました。"
    end
  end

  private
  def chat_group_params
    params.require(:chat_group).permit(:chat_group_name, :chat_group_description, user_ids:[])
  end

end
