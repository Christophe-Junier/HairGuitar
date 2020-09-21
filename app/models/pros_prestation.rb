# frozen_string_literal: true

class ProsPrestation < ApplicationRecord
  belongs_to :pro
  belongs_to :prestation
end
