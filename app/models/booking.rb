class Booking < ApplicationRecord
  belongs_to :user, :listing
end
