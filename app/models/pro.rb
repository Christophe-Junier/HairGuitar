# frozen_string_literal: true

# Pro are the pros who are giving prestations
class Pro < ApplicationRecord
  has_many :appointments
  has_many :opening_hours
  has_many :pros_prestations
  has_many :prestations, through: :pros_prestations
  has_many :bookings

  validates :name, presence: true
  validates :address, presence: true
  validates :max_kilometers, presence: true
  validates :lat, presence: true
  validates :lng, presence: true

  # coordinatify is used by many models, so its stands in ApplicationRecord
  before_create :coordinatify
  before_update :coordinatify
end
