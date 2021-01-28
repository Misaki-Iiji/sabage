class Picture < ApplicationRecord
  belongs_to :post
  has_many :picture_hits

  def favorited_by?(user) #picture_hits
    favorites.where(user_id: user.id).exists?
  end
  
  def hitted_by?(user)
    hitted.where(user_id: user.id).exists?
  end

  attachment :image
end
