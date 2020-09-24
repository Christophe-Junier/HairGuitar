# frozen_string_literal: true

# Service to generate lng and lat with an address using google API
class GoogleAddressToGeocodesService
  def initialize(address)
    @address = address
    @client = HTTPClient.new
    @uri = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@address.gsub(' ', '+')}"
    @api_key = ENV['GOOGLE_API_KEY']
  end

  def geocodes_address
    if @address.blank?
      OpenStruct.new(lat: '', lng: '')
    else
      structured_response = JSON.parse(@client.get_content("#{@uri}&key=#{@api_key}"))
      OpenStruct.new(structured_response['results'].first['geometry']['location'])
    end
  end
end
