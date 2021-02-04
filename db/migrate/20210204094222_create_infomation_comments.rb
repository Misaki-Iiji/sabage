class CreateInfomationComments < ActiveRecord::Migration[5.2]
  def change
    create_table :infomation_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :infomation_id

      t.timestamps
    end
  end
end
