class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :content, presence: true
  validates :user_id, uniqueness: true
end
