class FavoritesController < ApplicationController
  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy!
    redirect_to root_path(anchor: params[:game_id])
  end

  def create
    current_game = Game.find(params[:game_id])
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.game = current_game
    @favorite.save
    redirect_to root_path(anchor: params[:game_id])
  end
end
