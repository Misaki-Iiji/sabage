class GroupChat < ApplicationRecord
  belongs_to :user
  belongs_to :chat_group
end
