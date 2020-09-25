# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AvailableProForBookingService do
  let(:pro) { create(:pro) }
  let(:booking) { create(:booking) }
  let(:opening_hour) { create(:opening_hour, pro_id: pro.id) }
  let(:crossing_appointment) { create(:appointment, pro_id: pro.id) }
  let(:none_crossing_appointment) { create(:appointment, pro_id: pro.id, starts_at: DateTime.now - 2.days, ends_at: DateTime.now - 1.days ) }
  let(:prestation) { create(:prestation) }
  let(:service) { AvailableProForBookingService.new(booking) }

  it 'has no pro when appointment between booking' do
    pro.opening_hours << opening_hour
    pro.appointments << crossing_appointment
    pro.prestations << prestation
    booking.prestations << prestation
    expect(service.process_all).to eq([])
  end

  it 'has pro when appointment are not crossing booking' do
    pro.opening_hours << opening_hour
    pro.appointments << none_crossing_appointment
    pro.prestations << prestation
    booking.prestations << prestation
    expect(service.process_all).to eq([pro])
  end
end
