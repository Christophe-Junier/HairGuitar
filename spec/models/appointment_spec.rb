# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it 'is not valid without a start date' do
    appointment = Appointment.new(starts_at: nil, ends_at: DateTime.now)
    expect(appointment).to_not be_valid
  end

  it 'is not valid without an end date' do
    appointment = Appointment.new(starts_at: DateTime.now, ends_at: nil)
    expect(appointment).to_not be_valid
  end
end
