class GroupChatsController < ApplicationController

  def show
    @chat_group = ChatGroup.find(params[:id])
    @group_chats = @chat_group.group_chats.page(params[:page]).per(13)
    @group_chat = GroupChat.new(chat_group_id: @chat_group.id)

  end

  def create
    @group_chat = current_user.group_chats.new(chat_params)
    @group_chat.save
  end

  private
  def chat_params
    params.require(:group_chat).permit(:message, :chat_group_id)
  end
end
