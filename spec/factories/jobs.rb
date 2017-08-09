require 'faker'

FactoryGirl.define do
  factory :job do
    title { Faker::Lorem.sentence }
    details { Faker::Lorem.paragraph }

    location
    category
  end
end
