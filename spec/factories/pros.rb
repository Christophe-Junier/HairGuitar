# frozen_string_literal: true

FactoryBot.define do
  factory :pro do
    name           { 'John Do' }
    address        { '17 rue Camélinat 42000 Saint-Etienne' }
    max_kilometers { 40 }
    lat            { 1.1 }
    lng            { 1.1 }
  end
end
