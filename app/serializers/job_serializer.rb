module JobSerializer
  def serialize
    {
      "id" => self.id,
      "title" => self.title,
      "details" => self.details,
      "date_posted" => self.created_at.iso8601,
      "category" => {
        "name" => self.category.name,
        "id" => self.category.id
      },
      "location" => {
        "city" => self.location.capitalized_city,
        "state" => self.location.state,
        "id" => self.location.id
      }
    }
  end
end
