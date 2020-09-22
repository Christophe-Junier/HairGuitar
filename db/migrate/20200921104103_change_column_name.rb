# frozen_string_literal: true

# Migration that rename bad named column long is pro and booking table
class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :pros, :long, :lng
    rename_column :bookings, :long, :lng
  end
end
