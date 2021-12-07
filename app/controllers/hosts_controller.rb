class HostsController < ApplicationController
  def show
    @host = User.find(params[:id])
    @upcoming = @host.listings.first.bookings.where(booking_status: ["PENDING", "CONFIRMED"])
    @past = @host.listings.first.bookings.where(booking_status: ["COMPLETED", "CANCELLED"])
  end

  def edit
    @booking = Booking.find(params[:id])
  end
end