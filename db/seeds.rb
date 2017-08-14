require 'faker'

locations = [
  {city: "Brooklyn", state: "NY"},
  {city: "Cleveland", state: "OH"},
  {city: "Brooklyn", state: "OH"},
  {city: "Rochester", state: "NY"},
  {city: "Rochester", state: "MI"},
  {city: "Toledo", state: "OH"},
  {city: "San Diego", state: "CA"}
]

categories = ["Auto", "Business", "Cleaning", "Creative", "Delivery", "Financial",
              "Home", "Legal", "Travel", "Tech", "Other"]

categories.each {|category| Category.create(name: category)}

requests = ["I want you to", "Please help", "I need someone to", "Come and help"]
tasks = ["change my lightbulbs", "build a home gym", "make me a website", "cook me a four-course dinner",
         "draw a sketch of my house", "pick up a new table", "read me a bedtime story", "set up my Chromecast",
         "mow my lawn to perfection", "watch my cat for the weekend", "drive me to the airport", "look over a contract"]
num_tasks = tasks.length

20.times do
  job_params = {
    title: "#{requests.sample} #{tasks.sample}",
    details: Faker::Lorem.paragraph,
    category_name: Category.all.sample.name,
    location_attributes: locations.sample
  }

    job = Job.create(job_params)

    job.created_at = rand(0..7).days.ago
    job.save
end
