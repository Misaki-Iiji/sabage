class AddImageIdToFields < ActiveRecord::Migration[5.2]
  def change
    add_column :fields, :image_id, :string
    add_column :fields, :user_id, :integer
    remove_column :fields, :image, :string
  end
end
