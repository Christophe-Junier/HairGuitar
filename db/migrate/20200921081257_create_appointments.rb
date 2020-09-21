# frozen_string_literal: true

# Migration that add the table appointments
class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
