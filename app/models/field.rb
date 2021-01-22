class Field < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
  validates :introduction, length: { maximum: 300 }

  has_many :pictures
  has_many :field_favos

  def favorited_by?(current_user)
    field_favos.where(user_id: user.id).exists?
  end

  attachment :image #refile使うときのルール
  accepts_attachments_for :pictures, attachment: :picture

end
