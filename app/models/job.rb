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

  # Formats the creation date into a string
  def date_posted
    d = self.created_at
    d.strftime("%m/%d/%Y")
  end

end
