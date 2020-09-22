class AddingMultipleIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :pros, [:name, :address, :lat, :lng], unique: true
    add_index :appointments, [:starts_at, :ends_at, :pro_id], unique: true
  end
end
