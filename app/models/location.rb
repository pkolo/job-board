class Location < ApplicationRecord
  has_many :jobs

  validates :city, presence: true
  validates :state, presence: true
  validates :city, uniqueness: {scope: :state}

  def capitalized_city
    self.city.split.map(&:capitalize).join(' ')
  end
end
