# frozen_string_literal: true

# Migration that change booking starts_at column to datetime
# In order to do this you must drop the missformated column because database
# Can't convert Time to DateTime.
class ChangeBookingColumnType < ActiveRecord::Migration[6.0]
  def up
    remove_column :bookings, :starts_at
    add_column :bookings, :starts_at, :datetime
  end

  def down
    remove_column :bookings, :starts_at
    add_column :bookings, :starts_at, :time
  end
end
