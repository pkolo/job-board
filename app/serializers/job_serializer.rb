class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :details, :date_posted

  belongs_to :category
  belongs_to :location
end
