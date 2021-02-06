class CreateChatGroupToUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_group_to_users do |t|
      t.references :chat_group, foregin_key: true
      t.references :user, foregin_key: true
      t.timestamps
    end
  end
end
