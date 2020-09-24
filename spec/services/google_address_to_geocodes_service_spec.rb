# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GoogleAddressToGeocodesService do
  let(:address) { '23b rue etienne mimard 42000 saint etienne' }
  let(:service) { GoogleAddressToGeocodesService.new(address) }
  let(:no_address_service) { GoogleAddressToGeocodesService.new('') }

  it 'geocodes_address return empty lat and lng with no address' do
    expect(no_address_service.geocodes_address).to eq(OpenStruct.new(lat: '', lng: ''))
  end

  it 'geocodes_address return lat and lng with an address' do
    expect(service.geocodes_address).to eq(OpenStruct.new(lat: 45.4386206, lng: 4.3964458))
  end
end
