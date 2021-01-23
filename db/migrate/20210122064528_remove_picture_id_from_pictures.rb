class RemovePictureIdFromPictures < ActiveRecord::Migration[5.2]
  def change
    remove_column :pictures, :field_id, :integer
    remove_column :pictures, :picture_id, :string
    add_column :pictures, :image_id, :string
    add_column :pictures, :post_id, :integer
  end
end
