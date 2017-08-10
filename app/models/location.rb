class Location < ApplicationRecord
  has_many :jobs, inverse_of: :location

  validates :city, presence: true
  validates :state, presence: true
  validates :city, uniqueness: {scope: :state}

  def to_s
    "#{self.city}, #{self.state}"
  end
end
