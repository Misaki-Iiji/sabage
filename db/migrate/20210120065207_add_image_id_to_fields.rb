class AddImageIdToFields < ActiveRecord::Migration[5.2]
  def change
    add_column :fields, :image_id, :string
  end
end
