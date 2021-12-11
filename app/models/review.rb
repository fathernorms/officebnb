class Review < ApplicationRecord
  # Associations
  belongs_to :booking

  # Validations
  validates :user_review, length: { maximum: 300 }
  validates :user_rating, :inclusion => { :in => 0..5, :message => "should be betweeon 0 to 5" }
  validates :owner_review, length: { maximum: 300 }
  validates :owner_rating, :inclusion => { :in => 0..5, :message => "should be betweeon 0 to 5" }, allow_nil: true
end
