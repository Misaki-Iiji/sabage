class Post < ApplicationRecord
  has_many :pictures
  belongs_to :filed
  accepts_attachments_for :pictures, attachment: :image
end
