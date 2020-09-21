# frozen_string_literal: true

class Pro < ApplicationRecord
  has_many :appointments
  has_many :opening_hours
end
