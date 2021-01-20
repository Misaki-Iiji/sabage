class Picture < ApplicationRecord
  has_many :picture_hits
  belongs_to :field

  attachment :picture
end
