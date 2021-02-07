class ChatGroupsController < ApplicationController

  def index
    @chat_groups = ChatGroup.all
    # @chat_group = ChatGroupToUser.where(chat_group: chat_group, user: current_user)
  end

  def new
    @chat_group = ChatGroup.new
    # @chat_group.users << current_user #尖ってる方に情報を付け加える(自分を含めたユーザー)
  end

  def create
    chat_group = ChatGroup.new(chat_group_params)
    chat_group_to_user = ChatGroupToUser.new(chat_group: chat_group, user: current_user)
    if chat_group_to_user.save
      redirect_to action: 'index'
      flash[:notice] = "Clanを作成しました"
    else
      render 'new', alert: "Clan作成に失敗しました"
    end
  end

  def invite
    chat_group = ChatGroup.find(params[:id])
    chat_group_to_user = ChatGroupToUser.new(chat_group: chat_group, user: current_user)
    if chat_group_to_user.save
      redirect_to action: 'index'
      flash[:notice] = chat_group.chat_group_name + "参加しました。"
    end
  end

  def edit
    @chat_group = ChatGroup.find(params[:id])
  end

  def update
    chat_group = ChatGroup.find(params[:id])
    chat_group.update(chat_group_params)
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
