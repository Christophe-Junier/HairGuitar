# frozen_string_literal: true

class Booking < ApplicationRecord
  has_many :booked_prestations
  has_many :prestations, through: :booked_prestations
end
