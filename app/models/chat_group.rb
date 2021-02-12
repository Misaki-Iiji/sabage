class ChatGroup < ApplicationRecord
  has_many :group_chats
  has_many :chat_group_to_users
  has_many :users, through: :chat_group_to_users
  has_many :joins, dependent: :destroy

  validates :chat_group_name, presence: true, length: { maximum: 20 }
  validates :chat_group_description, presence: true, length: { maximum: 200 }

  def joined_by?(user)
    joins.where(user_id: user.id).exists?
  end
end
