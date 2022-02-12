# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Felipe-#{n}" }
    sequence(:email) { |n| "email#{n}@teste.com" }
    association :company
  end
end
