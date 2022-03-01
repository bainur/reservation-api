# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Guest, type: :model do
  let(:guest) { create(:guest) }
  let(:reservation) { create(:reservation, guest: guest) }
  let(:phone_number) { create(:phone_number, guest: guest) }

  it 'Successfully create guest' do
    expect(guest.id.present?).to eq(true)
  end

  it 'has reservations' do
    reservation
    expect(guest.reservations.present?).to eq(true)
  end

  it 'has phone_numbers' do
    phone_number
    expect(guest.phone_numbers.present?).to eq(true)
  end

  it 'Failed to create guest' do
    guest = build(:guest, email: '')
    expect(guest.valid?).to eq(false)
  end
end
