# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:guest) { create(:guest) }
  let(:phone_number) { create(:phone_number, guest: guest) }

  it 'Successfully create phone_number' do
    expect(phone_number.id.present?).to eq(true)
  end

  it 'belongs_to guest' do
    expect(phone_number.guest.present?).to eq(true)
  end
end
