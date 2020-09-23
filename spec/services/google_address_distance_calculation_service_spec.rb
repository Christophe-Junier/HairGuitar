# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GoogleAddressDistanceCalculationService do
  let(:service) { GoogleAddressDistanceCalculationService.new }
  let(:pro) { build(:pro) }
  let(:booking) { build(:booking) }

  it 'get_pro_booking_distance return a distance between an address and a booking' do
    expect(service.get_pro_booking_distance(pro, booking)).to eq('0.4')
  end
end
