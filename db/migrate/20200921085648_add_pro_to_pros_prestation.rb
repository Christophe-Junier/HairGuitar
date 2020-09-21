# frozen_string_literal: true

# Migration that add pro index to pros_prestations
class AddProToProsPrestation < ActiveRecord::Migration[6.0]
  def change
    add_reference :pros_prestations, :pro, null: false, foreign_key: true
  end
end
