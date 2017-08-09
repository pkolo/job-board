FactoryGirl.define do
  factory :category do |f|
    f.name ["Home", "Garden", "Repair", "Construction"].sample
  end
end
