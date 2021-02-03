class AddUsersToImageId < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_id, :string
    add_column :users, :main_gun, :string
    add_column :users, :sub_gun, :string
    add_column :users, :introduction, :string
  end
end
