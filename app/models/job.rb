class Job < ApplicationRecord
  belongs_to :category
  belongs_to :location

  validates :title, presence: true
  validates :details, presence: true

  # Sets associated category by name
  def category_name=(name)
    self.category = Category.find_or_initialize_by(name: name)
  end

  def location_attributes=(attrs)
    self.location = Location.find_or_initialize_by(city: attrs[:city], state: attrs[:state])
  end

  # Formats a hash to be converted to JSON and returned by the API.
  def serialize
    {
      id: self.id,
      title: self.title,
      details: self.details,
      date_posted: self.nice_date,
      category: self.category.name,
      city: self.location.to_s
    }
  end

  # Formats the creation date into a string
  def nice_date
    d = self.created_at
    d.strftime("%m/%d/%Y")
  end

end
