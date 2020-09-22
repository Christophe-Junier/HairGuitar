class AddProToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :pro, null: false, foreign_key: true
  end
end
