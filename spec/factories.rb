# frozen_string_literal: true

FactoryBot.define do
  factory :guest do
    first_name { 'Joe' }
    last_name { 'Biden' }
    email { 'joe@gmail.com' }
  end

  factory :reservation do
    reservation_code { 'RC01' }
    start_date { Date.current }
    end_date { Date.current }
    nights { 1 }
    guests { 1 }
    adults { 1 }
    children { 1 }
    infants { 1 }
    status { 'accepted' }
    currency { 'AUD' }
    payout_price { 4200 }
    security_price { 500 }
    total_price { 4700 }
  end

  factory :phone_number do
    phone { '639123456780' }
  end
end
