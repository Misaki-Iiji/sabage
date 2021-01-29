class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 20 }

  # ユーザーの`deleted_at`をタイムスタンプで更新
  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  # ユーザーのアカウントが有効か確認
  def active_for_authentication?
    super && !deleted_at
  end

  # 削除したユーザーにカスタムメッセージ
  def inactive_message
    !deleted_at ? super : :deleted_account
  end

has_many :picture_hits, dependent: :destroy
has_many :field_favorites, through: :favorites, source: :field, dependent: :destroy
#has_many :favoriteだとthroughとかぶるからエラーになる。別の名前にして、field_favoritesなんてテーブルは無いけど、sourceで指定しておくと大丈夫
end
