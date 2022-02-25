class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.game = Game.find(params[:game_id])
    @review.user = current_user
    @game = Game.find(params[:game_id])
    @booking = Booking.new
    @reviews = Review.all
    if @review.save
      redirect_to game_path(params[:game_id], anchor: "review-#{@review.id}")
    else
      render 'games/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
