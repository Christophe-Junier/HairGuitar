class AddPrestationToBookedPrestation < ActiveRecord::Migration[6.0]
  def change
    add_reference :booked_prestations, :prestation, null: false, foreign_key: true
  end
end
