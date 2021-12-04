class AddGuestsToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :guests, :integer, default: 1
    add_column :bookings, :cost, :float
  end
end
