class AddProToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_reference :appointments, :pro, null: false, foreign_key: true
  end
end
