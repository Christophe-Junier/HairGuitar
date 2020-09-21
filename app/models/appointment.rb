# frozen_string_literal: true

# Appointment are appointments that a pro got scheduled
class Appointment < ApplicationRecord
  belongs_to :pro
end
