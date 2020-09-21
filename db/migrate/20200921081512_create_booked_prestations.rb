class CreateBookedPrestations < ActiveRecord::Migration[6.0]
  def change
    create_table :booked_prestations do |t|

      t.timestamps
    end
  end
end
