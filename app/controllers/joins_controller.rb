class JoinsController < ApplicationController

  def create
    @chat_group = ChatGroup.find(params[:chat_group_id])
    @group_chat = GroupChat.new(chat_group_id: @chat_group.id)
    @group_chats = @chat_group.group_chats.page(params[:page])
    join = current_user.joins.new(chat_group_id: @chat_group.id)
    join.save
  end

  def destroy
    @chat_group = ChatGroup.find(params[:chat_group_id])
    @group_chat = GroupChat.new(chat_group_id: @chat_group.id)
    @group_chats = @chat_group.group_chats
    join = current_user.joins.find_by(chat_group_id: @chat_group.id)
    join.destroy
  end

end
