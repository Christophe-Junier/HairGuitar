# frozen_string_literal: true

class BookedPrestation < ApplicationRecord
  belongs_to :prestation
  belongs_to :booking
end
