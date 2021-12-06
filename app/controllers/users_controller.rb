class UsersController < ApplicationController
  # SHOW
  def show
  @user = User.find(params[:id])
  @upcoming = @user.bookings.where(booking_status: ["PENDING", "CONFIRMED"])
  @past = @user.bookings.where(booking_status: ["COMPLETED", "CANCELLED"])
  end
end
