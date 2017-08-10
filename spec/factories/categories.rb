FactoryGirl.define do
  factory :category do |f|
    f.name { ["Home", "Garden", "Repair", "Construction"].sample }

    initialize_with { Category.find_or_create_by(name: name) }
  end
end
