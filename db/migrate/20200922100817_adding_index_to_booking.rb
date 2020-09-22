class AddingIndexToBooking < ActiveRecord::Migration[6.0]
  def change
    add_index :bookings, [:email, :name, :starts_at, :pro_id], unique: true
  end
end
