class Picture < ApplicationRecord
  # has_many :picture_hits
  belongs_to :post

  attachment :image
end
