# frozen_string_literal: true

# This class is used to create a booking object
class BookingcomService
  def initialize(params = {})
    @reservation_code = params[:code]
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @nights = params[:nights]
    @guests = params[:number_of_guests]
    @adults = params[:guest_details][:number_of_adults] if params[:guest_details]
    @children = params[:guest_details][:number_of_children] if params[:guest_details]
    @infants = params[:guest_details][:number_of_infants] if params[:guest_details]
    @status = params[:status_type]
    @guest = {
      email: params[:guest_email],
      first_name: params[:guest_first_name],
      last_name: params[:guest_last_name],
    }
    @phone_number = params[:guest_phone_numbers]
    @currency =  params[:host_currency]
    @payout_price = params[:expected_payout_amount]
    @security_price = params[:listing_security_price_accurate]
    @total_price = params[:total_paid_amount_accurate]
  end

  def params_reservation
    reservation_attributes
  end

  def params_guest
    guest_attributes
  end

  def params_guest_phones
    guest_phone_attributes
  end

  private

  def reservation_attributes
    {
      reservation_code: @reservation_code,
      start_date: @start_date,
      end_date: @end_date,
      nights: @nights,
      guests: @guests,
      adults: @adults,
      children: @children,
      infants: @infants,
      status: @status,
      currency: @currency,
      payout_price: @payout_price,
      security_price: @security_price,
      total_price: @total_price,
    }
  end

  def guest_attributes
    {
      first_name: @guest[:first_name],
      last_name: @guest[:last_name],
      email: @guest[:email]
    }
  end

  def guest_phone_attributes
    @phone_number.map{|s| {phone: s}}
  end
end
