class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 15 }
  validates :introduction, length: { maximum: 100 }
  validates :main_gun, length: { maximum: 30 }
  validates :sub_gun, length: { maximum: 30 }

  attachment :image

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

  has_many :picture_hits
  has_many :pictures, through: :picture_hits

  has_many :favorites
  has_many :fields, through: :favorites, dependent: :destroy

  has_many :user_rooms
  has_many :chats
  has_many :rooms, through: :user_rooms

  has_many :relationships #（foreign_key: 'user_id'は省略されてる）
  has_many :followings, through: :relationships, source: :follow #relationshipsテーブルのfollow_idを参考にして、followingsモデル(架空)にアクセス
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  #has_many :relaitonshipsの「逆方向」、class_name: 'Relationship'でrelationsipモデルの事、relaitonshipsテーブルにアクセスする時、follow_idを入口とする
  has_many :followers, through: :reverse_of_relationships, source: :user

  has_many :infomation_comments, dependent: :destroy

  def follow(other_user)
    unless self == other_user #フォローしようとしている other_user が自分自身ではないかを検証
      self.relationships.find_or_create_by(follow_id: other_user.id) #見つかれば Relation を返し、見つからなければ self.relationships.create(follow_id: other_user.id)
    end
  end

  def unfollow(other_user) #フォローがあればアンフォロー
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship #relationship が存在すれば destroy
  end

  def following?(other_user)
    self.followings.include?(other_user) #self.followings によりフォローしている User 達を取得、include?(other_user) によって other_user が含まれていないかを確認
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
  
end
