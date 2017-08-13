class Job < ApplicationRecord
  include JobSerializer

  belongs_to :category
  belongs_to :location
  validates_associated :category, :location

  validates :title, presence: true
  validates :details, presence: true
  validates :location, presence: true
  validates :category, presence: true

  def as_json(options)
    self.serialize
  end

  # Sets associated category by name
  def category_name=(name)
    self.category = Category.find_or_initialize_by(name: name)
  end

  def location_attributes=(attrs)
    self.location = Location.find_or_initialize_by(city: attrs[:city], state: attrs[:state])
  end

end
