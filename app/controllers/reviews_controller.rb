class ReviewsController < ApplicationController

  # NEW
  def new
    @review = Review.new
  end

  # CREATE
  def create
    @review = Review.new(review_params)
    @booking = List.find(params[:booking_id])
    @review.booking = @booking
    @review.save
    # Implement redirect logic
  end

  # EDIT
  def edit
    @review = Review.find(params[:id])
  end

  # UPDATE
  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    # Implement redirect logic
  end

  # DESTROY
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    # Implement redirect logic
  end
end
