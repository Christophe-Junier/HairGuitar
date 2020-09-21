class AddPrestationToProsPrestation < ActiveRecord::Migration[6.0]
  def change
    add_reference :pros_prestations, :prestation, null: false, foreign_key: true
  end
end
