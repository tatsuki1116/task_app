require 'rails_helper'

RSpec.describe Task, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  FactoryBot.define do
  	factory :task do
  		sequence(:task_name) { |n| "task_name#{n}"}
  		sequence(:details) { |n| "details#{n}"}

	    trait :no_task_name do
	      task_name {}
	    end

	    trait :no_details do
	      task_name {}
	    end

	    trait :too_details do
	      details {Faker::Lorem.characters(255)}
	    end
	end
end
