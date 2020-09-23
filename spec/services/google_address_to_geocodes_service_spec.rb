# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GoogleAddressToGeocodesService do
  let(:service) { GoogleAddressToGeocodesService.new }
  let(:address) { '23b rue etienne mimard 42000 saint etienne' }

  it 'get_geocodes return empty lat and lng with no address' do
    expect(service.get_geocodes('')).to eq(OpenStruct.new(lat: '', lng: ''))
  end

  it 'get_geocodes return lat and lng with an address' do
    expect(service.get_geocodes(address).lat).to eq(45.4386206)
    expect(service.get_geocodes(address).lng).to eq(4.3964458)
  end
end
