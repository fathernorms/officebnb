class ReviewsController < ApplicationController
  # NEW
  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # CREATE
  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.save!
    redirect_to user_path(current_user)
  end

  # EDIT X NOT NEEDED
  def edit
    @review = Review.find(params[:id])
  end

  # UPDATE X NOT NEEDED
  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    # Implement redirect logic
  end

  # DESTROY X NOT NEEDED
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    # Implement redirect logic
  end

  # Strong Params
  def review_params
    params.require(:review).permit(:user_review, :user_rating)
  end
end
