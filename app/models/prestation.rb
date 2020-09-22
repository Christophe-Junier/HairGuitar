# frozen_string_literal: true

# Prestation is the prestation offered
class Prestation < ApplicationRecord
  has_many :booked_prestations
  has_many :bookings, through: :booked_prestations
  has_many :pros_prestations
  has_many :pros, through: :pros_prestations

  validates :reference, presence: true
  validates :reference, uniqueness: true
  validates :duration, presence: true
end
