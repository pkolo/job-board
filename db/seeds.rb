require 'faker'

locations = [
  {city: "Brooklyn", state: "NY"},
  {city: "Cleveland", state: "OH"},
  {city: "Brooklyn", state: "OH"},
  {city: "Rochester", state: "NY"},
  {city: "Rochester", state: "MI"},
  {city: "Toledo", state: "OH"}
]

categories = ["Home", "Repair", "Garden", "Construction"]

20.times do
  job_params = {
    title: Faker::Lorem.sentence,
    details: Faker::Lorem.paragraph,
    category_name: categories.sample,
    location_attributes: locations.sample
  }

    job = Job.create(job_params)

    job.created_at = rand(0..7).days.ago
    job.save
end
