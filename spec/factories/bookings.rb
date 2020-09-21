# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    name      { 'Marie Do' }
    address   { '18 rue Camélinat 42000 Saint-Etienne' }
    email     { 'MarieDoe@hotmail.com' }
    lat       { 1.15 }
    lng       { 1.15 }
    starts_at { DateTime.now }
  end
end
