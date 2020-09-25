# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    ends_at   { DateTime.now + 30.minutes }
    starts_at { DateTime.now - 30.minutes }
  end
end
