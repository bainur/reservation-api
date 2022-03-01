class Reservation < ApplicationRecord
  belongs_to :guest

  validates :reservation_code, presence: true
end
