# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GoogleAddressDistanceCalculationService do
  let(:pro) { build(:pro) }
  let(:booking) { build(:booking) }
  let(:service) { GoogleAddressDistanceCalculationService.new(pro, booking) }

  it 'get_pro_booking_distance return a distance between an address and a booking' do
    expect(service.pro_booking_distance).to eq('0.4')
  end
end
