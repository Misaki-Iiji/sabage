class CreateFieldFavos < ActiveRecord::Migration[5.2]
  def change
    create_table :field_favos do |t|
      t.integer :user_id
      t.integer :field_id

      t.timestamps
    end
  end
end
