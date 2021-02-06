class CreateChatGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_groups do |t|
      t.string :chat_group_name, null: false
      t.text :chat_group_description

      t.timestamps
    end
  end
end
