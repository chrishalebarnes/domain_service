FactoryGirl.define do
  sequence(:hostname) { |n| "localhost#{n}" }

  factory :domain do
    hostname
  end
end