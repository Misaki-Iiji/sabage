class ChatGroup < ApplicationRecord
  has_many :chat_group_to_users
  has_many :users, through: :chat_group_to_users

  accepts_nested_attributes_for :users
end
