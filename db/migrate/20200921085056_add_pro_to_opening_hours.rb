# frozen_string_literal: true

# Migration that add pro index to opening_hours
class AddProToOpeningHours < ActiveRecord::Migration[6.0]
  def change
    add_reference :opening_hours, :pro, null: false, foreign_key: true
  end
end
