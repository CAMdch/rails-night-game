class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query_game].present? && params[:query_city].present?
      @query = params[:query_game]
      @games = Game.search_by_name_and_description(@query).near(params[:query_city], 2)
    elsif params[:query_city].present?
      @games = Game.near(params[:query_city], 2)
    elsif params[:query_game].present?
      @query = params[:query_game]
      @games = Game.search_by_name_and_description(@query)
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
