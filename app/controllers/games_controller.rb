class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
    @booking = Booking.new
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

  private

  def game_params
    params.require(:game).permit(:name, :description, :address, :price, :min_player, :max_player, :photo, :playtime)
  end
end
