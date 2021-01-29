class AddDeletedAtColumnToFields < ActiveRecord::Migration[5.2]
  def change
    add_column :fields, :deleted_at, :datetime
  end
end
