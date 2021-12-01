class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
  has_many :listings 
  has_many :bookings
=======
  has_many :listings
  has_many :bookings
  has_one_attached :photo
>>>>>>> bcc06b12636be4a78e82f6ead83a48280f17cef4
end
