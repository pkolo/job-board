require 'faker'

FactoryGirl.define do
  factory :job do
    title { Faker::Lorem.characters(char_count = 70) }
    details { Faker::Lorem.paragraph }

    location
    category
  end
end
