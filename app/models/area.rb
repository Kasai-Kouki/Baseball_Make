class Area < ApplicationRecord
  belongs_to :user
  validates :area, presence: true
end
