# frozen_string_literal: true

# Migration that add pro index to bookings
class AddProToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :pro, null: true, foreign_key: true
  end
end
