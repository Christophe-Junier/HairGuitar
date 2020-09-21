# frozen_string_literal: true

# Pro are the pros who are giving prestations
class Pro < ApplicationRecord
  has_many :appointments
  has_many :opening_hours
  has_many :pros_prestations
  has_many :prestations, through: :pros_prestations
end
