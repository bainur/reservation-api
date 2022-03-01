# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Add reservation', type: :request do
  let(:params) do
    JSON.parse(File.read(File.expand_path('../support/params_booking_com.json', __dir__)))
  end
  let(:params_airbnb) do
    JSON.parse(File.read(File.expand_path('../support/params_airbnb.json', __dir__)))
  end

  it 'Successfully create reservation from booking.com' do
    post '/reservations', params: params
    response_body = JSON.parse(response.body)
    expect(response_body['status']).to eq('success')
  end

  it 'Successfully create reservation from Airbnb' do
    post '/reservations', params: params_airbnb
    response_body = JSON.parse(response.body)
    expect(response_body['status']).to eq('success')
  end

  it 'Failed to create reservation from booking.com and return status \'failed\' and message error' do
    params['reservation']['code'] = ''
    post '/reservations', params: params
    response_body = JSON.parse(response.body)
    expect(response_body['status']).to eq('failed')
    expect(response_body['message']).to eq('Reservation code can\'t be blank')
  end

  it 'Failed to create guest from booking.com and return status \'failed\' and message error' do
    params['reservation']['guest_email'] = ''
    post '/reservations', params: params
    response_body = JSON.parse(response.body)
    expect(response_body['status']).to eq('failed')
    expect(response_body['message']).to eq('Email can\'t be blank')
  end

  it 'Failed to create reservation from Airbnb and return status \'failed\' and message error' do
    params_airbnb['reservation_code'] = ''
    post '/reservations', params: params_airbnb
    response_body = JSON.parse(response.body)
    expect(response_body['status']).to eq('failed')
    expect(response_body['message']).to eq('Reservation code can\'t be blank')
  end

  it 'Failed to create guest from Airbnb and return status \'failed\' and message error' do
    params_airbnb['guest']['email'] = ''
    post '/reservations', params: params_airbnb
    response_body = JSON.parse(response.body)
    expect(response_body['status']).to eq('failed')
    expect(response_body['message']).to eq('Email can\'t be blank')
  end
end
