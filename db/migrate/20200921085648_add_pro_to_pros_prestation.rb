class AddProToProsPrestation < ActiveRecord::Migration[6.0]
  def change
    add_reference :pros_prestations, :pro, null: false, foreign_key: true
  end
end
