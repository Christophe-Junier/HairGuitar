# frozen_string_literal: true

# Main Rails Model
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def coordinatify
    # GOOGLE API CALL SERVICE WILL BE CALLED THERE
    # coordinates = AddressToCoordinatesService.new(self.address)
    # self.lat = coordinates.lat
    # self.long = coordinates.long
  end
end
