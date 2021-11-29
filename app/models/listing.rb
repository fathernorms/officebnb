class Listing < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :description, presence: true, length: { maximum: 300 }
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :rate_per_day, presence: true, numericality: true
end
