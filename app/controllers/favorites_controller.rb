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
# favorite.game == current_game

# existing_wish = current_user.favorites.select { |favorite| favorite.game == current_game }
# if existing_wish.class == Array
#   existing_wish.each do |wish|
#     wish.destroy
#   end
# else
#   existing_wish.destroy
# end

    # if favorite.game == current_game
      #   redirect_to game_favorite_path(current_game, favorite)
      # else
