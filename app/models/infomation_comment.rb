class InfomationComment < ApplicationRecord
  belongs_to :user
  belongs_to :infomation

  validates :comment, presence: true
end
