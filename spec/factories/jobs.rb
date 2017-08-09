require 'faker'

FactoryGirl.define do
  factory :job do
    title { Faker::Lorem.sentence }
    details { Faker::Lorem.paragraph }
    latitude 40.6782
    longitude -73.9442

    category
  end
end
