class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.integer :field_id
      t.string :pictures

      t.timestamps
    end
  end
end
