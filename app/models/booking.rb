class Booking < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :date_begin, :date_end, presence: true
  monetize :price_cents
end
