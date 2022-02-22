class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_game, only: %i[show destroy edit update]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def show
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
    params.require(:game).permit(:name, :description, :address, :price, :min_player, :max_player, :playtime)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
