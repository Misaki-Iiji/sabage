class RemovePicturesFromPictures < ActiveRecord::Migration[5.2]
  def change
    remove_column :pictures, :pictures, :string
  end
end
