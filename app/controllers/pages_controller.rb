class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @query = params[:query]
      @games = Game.where("name ILIKE ?", @query)
    else
      @games = Game.all
    end
  end
end
