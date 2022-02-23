class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @query = params[:query]
      @games = Game.where("name ILIKE ?", "%#{@query}%")

    else
      @games = Game.all
    end

    @markers = @games.geocoded.map do |game|
      {
        lat: game.latitude,
        lng: game.longitude,
        info_window: render_to_string(partial: "games/info_window", locals: { game: game })

      }
    end
  end
end
