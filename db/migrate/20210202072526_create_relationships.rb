class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :user, type: :bigint, foreign_key: true
      t.references :follow, foreign_key: { to_table: :users }

      t.timestamps

      t.index %i[user_id follow_id], unique: true
      # user_id と follow_id のペアで重複するものが保存されないようにするデータベースの設定
    end
  end
end
