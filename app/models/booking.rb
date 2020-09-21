# frozen_string_literal: true

# Booking is the reservation done by an user
class Booking < ApplicationRecord
  has_many :booked_prestations
  has_many :prestations, through: :booked_prestations
end
