class JoinsController < ApplicationController
  
  def create
    chat_group = ChatGroup.find(params[:chat_group_id])
    join = current_user.joins.new(chat_group_id: chat_group.id)
    join.save
    redirect_to chat_group_path(chat_group)
  end

  def destroy
    chat_group = ChatGroup.find(params[:chat_group_id])
    join = current_user.joins.find_by(chat_group_id: chat_group.id)
    join.destroy
    redirect_to chat_group_path(chat_group)  
  end
    
end
