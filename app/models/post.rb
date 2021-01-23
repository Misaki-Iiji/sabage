class Post < ApplicationRecord
  has_many :pictures
  belongs_to :filed, optional: true
  accepts_attachments_for :pictures, attachment: :image
end
