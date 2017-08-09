class Job < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
  validates :details, presence: true
end
