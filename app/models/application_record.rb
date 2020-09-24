# frozen_string_literal: true

# Main Rails Model
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def geocode(_address)
    results = GoogleAddressToGeocodesService.new(address).geocodes_address
    self.lat = results.lat
    self.lng = results.lng
  end
end
