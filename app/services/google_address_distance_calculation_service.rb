# frozen_string_literal: true

# Service to generate lng and lat with an address using google API
class GoogleAddressDistanceCalculationService
  def get_pro_booking_distance(pro, booking)
      client = HTTPClient.new
      uri = 'https://maps.googleapis.com/maps/api/distancematrix/json?origins=' \
            + pro.address.gsub(' ', '+') \
            + '&destinations=' \
            + booking.address.gsub(' ', '+')
      api_key = ENV['GOOGLE_API_KEY']
      structured_response = JSON.parse(client.get_content("#{uri}&key=#{api_key}"))
      structured_response['rows'].first['elements'].first['distance']['text'].split(' ').first
  end
end
