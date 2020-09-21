# frozen_string_literal: true

# Migration that add the table OpeningHour
class CreateOpeningHours < ActiveRecord::Migration[6.0]
  def change
    create_table :opening_hours do |t|
      t.string :day
      t.time :starts_at
      t.time :ends_at

      t.timestamps
    end
  end
end
