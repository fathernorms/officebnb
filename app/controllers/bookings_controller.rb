class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing
    @booking.user = current_user
    @booking.start_date = booking_params["start_date(1i)"]+booking_params["start_date(2i)"]+booking_params["start_date(3i)"]
    @booking.end_date = booking_params["end_date(1i)"]+booking_params["end_date(2i)"]+booking_params["end_date(3i)"]
    if @booking.start_date && @booking.end_date
      @booking.cost = (@booking.end_date - @booking.start_date) * @booking.listing.rate_per_day
    else
      @booking.cost = 0
    end
    @booking.save
    redirect_to booking_path(@booking)
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)

    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guests, :booking_status)
  end
end
