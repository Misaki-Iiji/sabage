class Infomation < ApplicationRecord
  belongs_to :field
  has_many :infomation_comments, dependent: :destroy
 
  validates :title, presence: true
  validates :body, presence: true

end
