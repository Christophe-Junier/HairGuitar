# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:pro) { create(:pro) }
  let(:no_starting_date_appointment) { build(:appointment, starts_at: nil, pro_id: pro.id) }
  let(:no_ending_date_appointment) { build(:appointment, ends_at: nil, pro_id: pro.id) }
  let(:no_pro_appointment) { build(:appointment) }
  let(:appointment) { build(:appointment, pro_id: pro.id) }

  it 'is unvalid without a starting date' do
    expect(no_starting_date_appointment).to_not be_valid
  end

  it 'is unvalid without an ending date' do
    expect(no_ending_date_appointment).to_not be_valid
  end

  it 'is unvalid without a pro id' do
    expect(no_pro_appointment).to_not be_valid
  end

  it 'is valid' do
    expect(appointment).to be_valid
  end
end
