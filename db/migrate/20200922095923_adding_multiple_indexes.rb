# frozen_string_literal: true

# Migration add index to pro and appointments table to avoid duplication
class AddingMultipleIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :pros, %i[name address lat lng], unique: true
    add_index :appointments, %i[starts_at ends_at pro_id], unique: true
  end
end
