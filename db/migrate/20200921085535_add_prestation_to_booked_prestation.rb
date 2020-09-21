# frozen_string_literal: true

# Migration that add prestation index to booked_prestations
class AddPrestationToBookedPrestation < ActiveRecord::Migration[6.0]
  def change
    add_reference :booked_prestations, :prestation, null: false, foreign_key: true
  end
end
