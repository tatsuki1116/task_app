# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}"}
    sequence(:email) { |n| "test#{n}@test.com" }
    password { '111111' }
  end
end
