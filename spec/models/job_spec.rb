require "rails_helper"

Rspec.describe "Job", type: :model do
  describe "Factory" do
    Factory.create(:job).should be_valid
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:details) }
  end

  describe "Associations" do
    it { should belong_to(:category) }
  end
end
