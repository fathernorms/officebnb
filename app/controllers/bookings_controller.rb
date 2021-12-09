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
    if @booking.start_date == @booking.end_date
      @booking.cost = @listing.rate_per_day * @booking.guests
    else
      @booking.cost = @listing.rate_per_day * @booking.guests * ((@booking.end_date - @booking.start_date).to_i + 1)
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

  def confirm
    @booking = Booking.find(params[:id])
    @booking.update(booking_status: "CONFIRMED")
    redirect_to host_path(@booking.listing.user)
  end

  def cancel
    @booking = Booking.find(params[:id])
    @booking.update(booking_status: "CANCELLED")
    redirect_to host_path(@booking.listing.user)
  end

  def user_cancel
    @booking = Booking.find(params[:id])
    @booking.update(booking_status: "CANCELLED")
    redirect_to user_path(@booking.user)
  end

  def complete
    @booking = Booking.find(params[:id])
    @booking.update(booking_status: "COMPLETED")
    redirect_to host_path(@booking.listing.user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guests, :booking_status)
  end
end
