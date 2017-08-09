require "rails_helper"

Rspec.describe "Category", type: :model do

  describe "Factory" do
    Factory.create(:category).should be_valid
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end

  describe "Associations" do
    it { should have_many(:jobs) }
  end
end
