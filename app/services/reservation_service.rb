# frozen_string_literal: true

# Reservation service
class ReservationService
  attr_accessor :reservation, :errors

  def initialize(params)
    @parameters = params
    @errors = ''
  end

  def save
    Reservation.transaction do
      guest = build_guest
      reservation = build_reservation(guest)
      return reservation if reservation.save && guest.save

      self.errors = error_messages_handler(reservation, guest)
      raise ActiveRecord::Rollback
    end
  end

  private

  def build_reservation(guest)
    self.reservation = guest.reservations
                            .find_or_initialize_by(reservation_code: reservation_attributes[:reservation_code])
    reservation.attributes = reservation_attributes
    reservation
  end

  def build_guest
    guest = Guest.find_or_initialize_by(email: guest_attributes[:email])
    guest.attributes = guest_attributes
    guest.phone_numbers.destroy_all
    guest.phone_numbers.build(phone_attributes)
    guest
  end

  def error_messages_handler(reservation, guest)
    return reservation.errors.full_messages.join(', ') unless reservation.valid?
    return guest.errors.full_messages.join(', ') unless guest.valid?

    ''
  end

  def mapping_service
    if @parameters.key?('reservation_code')
      AirbnbService.new(@parameters)
    else
      BookingcomService.new(@parameters['reservation'])
    end
  end

  def reservation_attributes
    mapping_service.params_reservation
  end

  def guest_attributes
    mapping_service.params_guest
  end

  def phone_attributes
    mapping_service.params_guest_phones
  end
end
