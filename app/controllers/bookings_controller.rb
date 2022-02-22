class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.game = Game.find(params[:game_id])
    @booking.user = current_user
    @booking.status = "Waiting"
    if @booking.save
      redirect_to profil_path(current_user.id)
    else
      render 'games/show'
    end
  end

  def index
    raise
  end

  private

  def booking_params
    params.require(:booking).permit(:date_end, :date_begin)
  end
end
