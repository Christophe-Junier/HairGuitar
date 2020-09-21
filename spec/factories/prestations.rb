# frozen_string_literal: true

FactoryBot.define do
  factory :prestation do
    reference { 'Haircut'}
    duration  { 30 }
  end
end
