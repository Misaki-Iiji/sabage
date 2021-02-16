class Field < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
  validates :introduction, length: { maximum: 300 }
  validates :address, presence: true

  has_many :posts
  has_many :favorites
  has_many :infomation, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  attachment :image # refile使うときのルール
  accepts_attachments_for :pictures, attachment: :picture
  
  geocoded_by :address #住所登録した際に緯度と経度のカラムにも自動的に値を入れてくれる
  after_validation :geocode, if: :address_changed?
end
