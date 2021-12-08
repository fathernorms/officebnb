class RenameOldDateAttrs < ActiveRecord::Migration[6.1]
  def change
    rename_column :bookings, :start_date, :old_start_date
    rename_column :bookings, :end_date, :old_end_date
  end
end
