FactoryGirl.define do
  factory :category do |f|
    f.firstname ["Home", "Garden", "Repair", "Construction"].sample
  end
end
