class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_game, only: %i[show destroy edit update]

  def index
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

  def new
    @game = Game.new
  end

  def show
    @booking = Booking.new
    @review = Review.new
    @reviews = Review.where('game_id = ?', @game.id)
    @average_stars = average_stars
    @booking_json = @game.bookings.map do |booking|
      if booking.status == "Accept"
        start_date = booking.date_begin.strftime('%Y-%m-%d')
        end_date = booking.date_end.strftime('%Y-%m-%d')
        { from: start_date, to: end_date }
      end
    end

    @review_availablility = false if @game.reviews[0].nil?

    if current_user.nil?
      @review_availablility = false
      @review_login = false
    elsif @game.reviews.blank?
      @review_availablility = true
      @review_login = true
    else
      @game.reviews.each do |review|
        if review.user_id == current_user.id
          @review_availablility = false
          @review_login = true
        end
      end
    end

    @marker = [{ lat: @game.latitude, lng: @game.longitude }]
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

  def average_stars
    @game = Game.find(params[:id])
    @review_all = Review.where('game_id = ?', @game.id)
    sum_stars = @review_all.map do |review|
      review.stars
    end
    @review_all.count.zero? ? average_stars = 0 : average_stars = sum_stars.sum / @review_all.count
    return average_stars
  end

  def game_params
    params.require(:game).permit(:name, :description, :address, :price, :min_player, :max_player, :playtime, photos: [])
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
