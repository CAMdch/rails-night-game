class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings
  has_many :games, through: :bookings
  has_many :reviews
  has_many :favorites, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :phone, presence: true
  validates_format_of :phone, with: /(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/

  def get_favorite(game)
    self.favorites.find_by(game_id: game.id)
  end
end
