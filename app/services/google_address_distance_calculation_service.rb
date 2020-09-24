# frozen_string_literal: true

# Service to generate lng and lat with an address using google API
class GoogleAddressDistanceCalculationService
  def initialize(pro, booking)
    @pro = pro
    @booking = booking
    @client = HTTPClient.new
    @uri = 'https://maps.googleapis.com/maps/api/distancematrix/json'
    @params = "?origins=#{@pro.address.gsub(' ', '+')}&destinations=#{@booking.address.gsub(' ', '+')}"
    @api_key = ENV['GOOGLE_API_KEY']
  end

  # method to get the booking distance between a pro and a booking
  def pro_booking_distance
    structured_response = JSON.parse(@client.get_content("#{@uri + @params}&key=#{@api_key}"))
    structured_response['rows'].first['elements'].first['distance']['text'].split(' ').first
  end
end
