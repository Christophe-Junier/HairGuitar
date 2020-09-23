# frozen_string_literal: true

# Main Rails Model
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def geocode(_address)
    # GOOGLE API CALL SERVICE WILL BE CALLED THERE
    geocode_service = GoogleAddressToGeocodesService.new
    results = geocode_service.get_geocodes(address)
    self.lat = results.lat
    self.lng = results.lng
  end
end
