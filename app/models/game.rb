class Game < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :description, :name, :price, :address, :min_player, :max_player, :playtime, presence: true
  validates :min_player, numericality: { greater_than: 0, less_than_or_equal_to: :max_player }
end
