class Game < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings

  validates :description, :name, :price, :address, :min_player, :max_player, :playtime, presence: true
end
