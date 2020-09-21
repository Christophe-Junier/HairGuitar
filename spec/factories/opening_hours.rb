# frozen_string_literal: true

FactoryBot.define do
  factory :opening_hour do
    ends_at   { Time.now }
    starts_at { Time.now }
    day       { 'monday' }
  end
end
