module JobSerializer
  def serialize
    {
      "id" => self.id,
      "title" => self.title,
      "details" => self.details,
      "date_posted" => self.date_posted,
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
