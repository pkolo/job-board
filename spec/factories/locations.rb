FactoryGirl.define do
  factory :location do
    place = [{city: "Brooklyn", state: "NY"}, {city: "Cleveland", state: "OH"}].sample

    city { place[:city] }
    state { place[:state] }

    initialize_with { Location.find_or_create_by(city: city, state: state) }
  end
end
