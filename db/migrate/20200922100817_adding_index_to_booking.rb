# frozen_string_literal: true

# Migration add index booking table to avoid duplication
class AddingIndexToBooking < ActiveRecord::Migration[6.0]
  def change
    add_index :bookings, %i[email name starts_at pro_id], unique: true
  end
end
