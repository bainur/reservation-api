class Guest < ApplicationRecord
  has_many :reservations
  has_many :phone_numbers

  validates :email, presence: true
end
