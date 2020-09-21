# frozen_string_literal: true

# Migration that add prestation index to pros_prestations
class AddPrestationToProsPrestation < ActiveRecord::Migration[6.0]
  def change
    add_reference :pros_prestations, :prestation, null: false, foreign_key: true
  end
end
