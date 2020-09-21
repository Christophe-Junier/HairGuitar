# frozen_string_literal: true

class Prestation < ApplicationRecord
  has_many :booked_prestations
  has_many :bookings, through: :booked_prestations
  has_many :pros_prestations
  has_many :pros, through: :pros_prestations
end
