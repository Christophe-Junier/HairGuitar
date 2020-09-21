# frozen_string_literal: true

# Opening hour is when a pro is available to work
class OpeningHour < ApplicationRecord
  belongs_to :pro
end
