class AddBookingToBookedPrestation < ActiveRecord::Migration[6.0]
  def change
    add_reference :booked_prestations, :booking, null: false, foreign_key: true
  end
end
