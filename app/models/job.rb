class Job < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
  validates :details, presence: true

  # Formats a hash to be converted to JSON and returned by the API.
  def serialize
    {
      id: self.id,
      title: self.title,
      details: self.details,
      date_posted: self.nice_date,
      category: self.category.name
    }
  end

  # Formats the creation date into a string
  def nice_date
    d = self.created_at
    d.strftime("%m/%d/%Y")
  end

end
