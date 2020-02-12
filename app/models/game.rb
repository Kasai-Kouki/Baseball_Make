class Game < ApplicationRecord
      validates :user_id, presence: true
      belongs_to :category
      belongs_to :stadium
      belongs_to :user
      has_many :comments
end
