class ChangeDefaultValueBookingStatus < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:bookings, :booking_status, 'PENDING')
  end
end
