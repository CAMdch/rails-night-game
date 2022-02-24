class Game < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_one_attached :photo, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :whichlists, dependent: :destroy

  validates :description, :name, :price, :address, :min_player, :max_player, :playtime, :photo, presence: true
  validates :name, length: { in: 3..60 }
  validates :min_player, numericality: { greater_than: 0, less_than_or_equal_to: :max_player }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
