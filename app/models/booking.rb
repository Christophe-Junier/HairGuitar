# frozen_string_literal: true

# Booking is the reservation done by an user
class Booking < ApplicationRecord
  has_many :booked_prestations
  has_many :prestations, through: :booked_prestations
  belongs_to :pro, optional: true

  validates_format_of :email, with: /\A\S+@.+\.\S+\z/, message: 'your email address is not valid'
  validates :name, presence: true
  validates :address, presence: true
  validates :starts_at, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
end
