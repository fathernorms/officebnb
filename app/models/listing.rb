class Listing < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :bookings

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :description, presence: true, length: { maximum: 800 }
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :rate_per_day, presence: true, numericality: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
