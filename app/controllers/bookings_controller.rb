class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.game = Game.find(params[:game_id])
    @booking.user = current_user
    @booking.status = "Waiting"
    @game = Game.find(params[:game_id])
    @reviews = Review.all
    @review = Review.new
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
    if time_overlap?
      flash[:alert] = ""
    else
      @booking.status = "Accept"
      @booking.save
      @game = @booking.game
    end
    redirect_to game_bookings_path(@booking.game)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy!
    redirect_to profil_path(current_user.id)
  end

  private

  def booking_params
    params.require(:booking).permit(:date_end, :date_begin)
  end

  def time_overlap?
    @booking = Booking.find(params[:id])
    @overlap_count = 0
    @booking.game.bookings.each do |game_booking|
      overlap_filter1 = game_booking.date_begin.between?(@booking.date_begin, @booking.date_end)
      overlap_filter2 = game_booking.date_end.between?(@booking.date_begin, @booking.date_end)
      overlap_filter3 = @booking.date_begin.between?(game_booking.date_begin, game_booking.date_end)
      overlap_filter4 = @booking.date_end.between?(game_booking.date_begin, game_booking.date_end)
      overlap_filters = overlap_filter1 || overlap_filter2 || overlap_filter3 || overlap_filter4
      different_booking = game_booking != @booking
      @overlap_count += 1 if different_booking && overlap_filters && game_booking.status == "Accept"
    end
    return @overlap_count != 0
  end
end

# def accept
#   @booking = Booking.find(params[:id])
#   @overlap = 0
#   @booking.game.bookings.each do |game_booking|
#     overlap_filter1 = game_booking.date_begin.between?(@booking.date_begin, @booking.date_end)
#     overlap_filter2 = game_booking.date_end.between?(@booking.date_begin, @booking.date_end)
#     overlap_filter3 = @booking.date_begin.between?(game_booking.date_begin, game_booking.date_end)
#     overlap_filter4 = @booking.date_end.between?(game_booking.date_begin, game_booking.date_end)
#     overlap = overlap_filter1 || overlap_filter2 || overlap_filter3 || overlap_filter4
#     if game_booking != @booking && overlap && game_booking.status == "Accept"
#       @overlap += 1
#     end
#   end
#   if @overlap.zero?
#     @booking.status = "Accept"
#     @booking.save
#     @game = @booking.game
#   else
#     flash[:alert] = ""
#   end
#   redirect_to game_bookings_path(@booking.game)
# end
