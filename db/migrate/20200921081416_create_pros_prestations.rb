class CreateProsPrestations < ActiveRecord::Migration[6.0]
  def change
    create_table :pros_prestations do |t|

      t.timestamps
    end
  end
end
