# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:guest) { create(:guest) }
  let(:reservation) { create(:reservation, guest: guest) }

  it 'Successfully create reservation' do
    expect(reservation.id.present?).to eq(true)
  end

  it 'belongs_to guest' do
    expect(reservation.guest.present?).to eq(true)
  end

  it 'Failed to create reservation' do
    reservation = build(:reservation, reservation_code: '')
    expect(reservation.valid?).to eq(false)
  end
end
