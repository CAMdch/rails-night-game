class FavoritesController < ApplicationController
  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy!
    if params[:name] == 'favorite'
      redirect_to my_favorites_path
    else
      redirect_to root_path(anchor: "game-#{@favorite.game_id}")
    end
  end

  def create
    current_game = Game.find(params[:game_id])
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.game = current_game
    @favorite.save
    redirect_to root_path(anchor: "game-#{@favorite.game_id}")
  end
end
