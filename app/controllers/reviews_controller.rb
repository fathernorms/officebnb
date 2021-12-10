class ReviewsController < ApplicationController
  # NEW
  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  # CREATE
  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.save!
    redirect_to user_path(current_user)
  end

  # Strong Params
  def review_params
    params.require(:review).permit(:user_review, :user_rating, :owner_review, :owner_rating)
  end
end
