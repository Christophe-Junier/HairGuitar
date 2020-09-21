# frozen_string_literal: true

# Link between Booking and Prestation
class BookedPrestation < ApplicationRecord
  belongs_to :prestation
  belongs_to :booking
end
