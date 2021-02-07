class ChatGroup < ApplicationRecord
  has_many :group_chats
  has_many :chat_group_to_users
  has_many :users, through: :chat_group_to_users
  has_many :joins, dependent: :destroy
  
  def joined_by?(user)
    joins.where(user_id: user.id).exists?
  end

  # accepts_nested_attributes_for :users
end
