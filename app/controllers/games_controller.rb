class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_game, only: %i[show destroy edit update]

  def index
    if params[:query].present?
      @query = params[:query]
      @games = Game.where("name ILIKE ?", "%#{@query}%")
    else
      @games = Game.all
    end
  end

  def new
    @game = Game.new
  end

  def show
    @booking = Booking.new
    @review = Review.new
    @reviews = Review.all
    # @booking_json = @game.bookings.map do |booking|
    #   start_date = booking.date_begin.strftime('%Y-%m-%d')
    #   end_date = booking.date_end.strftime('%Y-%m-%d')
    #   { "from" => start_date, "to" => end_date }
    # end
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def destroy
    @game.destroy
    redirect_to profil_path(current_user)
  end

  def edit
  end

  def update
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :address, :price, :min_player, :max_player, :photo, :playtime)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
