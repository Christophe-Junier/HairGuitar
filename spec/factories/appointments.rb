# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    ends_at   { DateTime.now }
    starts_at { DateTime.now }
  end
end
