# frozen_string_literal: true

# Link between Pros and Prestation
class ProsPrestation < ApplicationRecord
  belongs_to :pro
  belongs_to :prestation
end
