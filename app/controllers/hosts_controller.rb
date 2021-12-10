class HostsController < ApplicationController
  def show
    @host = User.find(params[:id])
    if @host.listings.length.positive?
      @upcoming = bookings_retrieval(@host, "upcoming")
      @past = bookings_retrieval(@host, "past")
    else
      @upcoming = []
      @past = []
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  private

  def bookings_retrieval(host, status)
    result = []
    host.listings.find_each do |l|
      if status == "upcoming"
        result.push(l.bookings.where(booking_status: ["PENDING", "CONFIRMED"]))
      else
        result.push(l.bookings.where(booking_status: ["COMPLETED", "CANCELLED"]))
      end
    end
    result.flatten!
  end
end
