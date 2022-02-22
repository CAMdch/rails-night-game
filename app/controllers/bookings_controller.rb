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
    @user = current_user.id
    @game = Game.find(params[:game_id])
    @bookings = Booking.where('game_id = ?', params[:game_id])
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = "Decline"
    @booking.save
    @game = @booking.game
    redirect_to game_bookings_path(@game)
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "Accept"
    @booking.save
    @game = @booking.game
    redirect_to game_bookings_path(@game)
  end

  private

  def booking_params
    params.require(:booking).permit(:date_end, :date_begin)
  end
end
