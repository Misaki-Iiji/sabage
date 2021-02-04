class Infomation < ApplicationRecord
  belongs_to :field
  has_many :infomation_comments, dependent: :destroy
  
  attachment :image
  
  validates :title, presence: true
end
