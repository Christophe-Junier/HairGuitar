# frozen_string_literal: true

# Opening hour is when a pro is available to work
class OpeningHour < ApplicationRecord
  DAY_ARRAY = %w[monday tuesday wednesday thursday friday saturday sunday].freeze

  belongs_to :pro

  validates :ends_at, presence: true
  validates :starts_at, presence: true
  validates_inclusion_of :day, in: DAY_ARRAY, message: 'day is not included in the list'
end
