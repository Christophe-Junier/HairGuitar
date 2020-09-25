# frozen_string_literal: true

FactoryBot.define do
  factory :opening_hour do
    ends_at   { Time.now + 4.hours }
    starts_at { Time.now - 4.hours }
    day       { Time.now.strftime('%A').downcase }
  end
end
