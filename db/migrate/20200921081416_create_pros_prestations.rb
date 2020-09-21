# frozen_string_literal: true

# Migration that add the middle table pros_prestations
class CreateProsPrestations < ActiveRecord::Migration[6.0]
  def change
    create_table :pros_prestations, &:timestamps
  end
end
