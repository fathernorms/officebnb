class Review < ApplicationRecord
  # Associations
  belongs_to :booking

  # Validations
  validates :owner_review, length: { maximum: 300 }
  validates :user_review, length: { maximum: 300 }
  validates :owner_rating, :inclusion => 0..5
  validates :user_rating, :inclusion => 0..5
end
