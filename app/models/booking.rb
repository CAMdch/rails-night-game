class Booking < ApplicationRecord
  belongs_to :game, dependent: :destroy
  belongs_to :user
end
