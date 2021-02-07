class CreateGroupChats < ActiveRecord::Migration[5.2]
  def change
    create_table :group_chats do |t|
      t.integer :user_id
      t.integer :chat_group_id
      t.string :message

      t.timestamps
    end
  end
end
