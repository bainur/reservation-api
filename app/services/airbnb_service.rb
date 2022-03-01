class AirbnbService
  def initialize(params)
    @reservation_code = params[:reservation_code]
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @nights = params[:nights]
    @guests = params[:guests]
    @adults = params[:adults]
    @children = params[:children]
    @infants = params[:infants]
    @status = params[:status]
    @guest = params[:guest]
    @phone_number = params[:guest][:phone]
    @currency =  params[:currency]
    @payout_price = params[:payout_price]
    @security_price = params[:security_price]
    @total_price = params[:total_price]
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
    [
      { phone: @guest[:phone] }
    ]
  end
end
