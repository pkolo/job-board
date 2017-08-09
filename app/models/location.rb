class Location < ApplicationRecord
  has_many :jobs

  validates :city, presence: true
  validates :state, presence: true
  validates :city, uniqueness: {scope: :state}

  def to_s
    "#{self.city}, #{self.state}"
  end
end
