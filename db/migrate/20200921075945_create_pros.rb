class CreatePros < ActiveRecord::Migration[6.0]
  def change
    create_table :pros do |t|
      t.string :name
      t.string :address
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :long, precision: 10, scale: 6
      t.int :max_kilometers

      t.timestamps
    end
  end
end
