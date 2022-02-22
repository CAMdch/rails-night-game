class ProfilController < ApplicationController
  def show
    @bookings = Booking.where('user_id = ?', current_user.id)
    @games = Game.where('user_id = ?', current_user.id)
  end
end
