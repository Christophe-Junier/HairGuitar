# frozen_string_literal: true

# Migration that add the middle table booked_prestations
class CreateBookedPrestations < ActiveRecord::Migration[6.0]
  def change
    create_table :booked_prestations, &:timestamps
  end
end
